import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:wallet/slider_widget.dart';
import 'package:web3dart/web3dart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Wallet'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late Client httpClient;
  late Web3Client ethClient;
  bool data =  false;
  int myAmount = 0;
  final myAddress = "0x4140ea959e651C81a53261968Da11b12197EaD60";
  late String txHash;
  var myData;

  @override
  void initState() {
    super.initState();
    httpClient =  Client();
    ethClient = Web3Client("https://rinkeby.infura.io/v3/5d0efe045ddc4605b9335c81fd4bb710", httpClient);
    getBalance(myAddress);
  }

  Future<DeployedContract> loadContract() async{
    String abi = await rootBundle.loadString("assets/abi.json");
    String contractAddress = "0x90b44241A72cADCc873723c66C7f1fA6EB473C7b";

    final contract = DeployedContract(ContractAbi.fromJson(abi, "Wallet"), EthereumAddress.fromHex(contractAddress));

    return contract;
  }

  Future<List<dynamic>> query(String functionName, List<dynamic> args) async{
    final contract = await loadContract();
    final ethFunction = contract.function(functionName);
    final result = await ethClient.call(contract: contract, function: ethFunction, params: args);
    return result;
  }

  Future<void> getBalance(String targetAddress) async {
  //  EthereumAddress address = EthereumAddress.fromHex(targetAddress);
    List<dynamic> result = await query("getBalance", []);
    myData = result[0];
    data = true;
    setState(() {});
  }

  Future<String> submit(String functionName, List<dynamic> args) async {
    EthPrivateKey credentials = EthPrivateKey.fromHex("120e61057055b379c7983210346e335399993e959ab804289a76d800075d1eb3");
    DeployedContract contract = await loadContract();
    final ethFunction = contract.function(functionName);
    final result = await ethClient.sendTransaction(credentials, Transaction.callContract(contract: contract, function: ethFunction, parameters: args), fetchChainIdFromNetworkId: true);
    return result;
  }


  Future<String> sendCoin() async{
    var bigAmount = BigInt.from(myAmount);
    var response = await submit("depositBalance", [bigAmount]);
    print("Deposited");
    txHash = response;
    setState(() {});
    return response;
  }

  Future<String> withdrawCoin() async{
    var bigAmount = BigInt.from(myAmount);
    var response = await submit("withdrawBalance", [bigAmount]);
    print("Withdrawn");
    txHash = response;
    setState(() {});
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Vx.gray200,

      body: ZStack([
        VxBox()
            .blue600
            .size(context.screenWidth, context.percentHeight*30)
            .make(),
        VStack([
          (context.percentHeight * 10).heightBox,
          "\$Wallet".text.xl4.white.bold.center.makeCentered().py16(),
            (context.percentHeight * 5).heightBox,
          VxBox(child: VStack([
            "Balance".text.gray700.xl2.semiBold.makeCentered(),
            10.heightBox,
            data ? "\$$myData".text.bold.xl6.makeCentered().shimmer()
                : CircularProgressIndicator().centered()
          ]))
              .p16
              .white
              .size(context.screenWidth, context.percentHeight*20)
              .rounded
              .shadowXl
              .make()
              .p16(),
          30.heightBox,
          SliderWidget(
            min: 0,
            max: 100,
            finalVal: (value){
              myAmount = (value * 100).round();
              print(myAmount);
            },
          ).centered(),
          HStack([
            // ignore: deprecated_member_use
            FlatButton.icon(
                onPressed:() => getBalance(myAddress),
                color: Colors.blue,
                shape: Vx.roundedSm,
                icon: Icon(Icons.refresh, color: Colors.white),
                label: "Refresh".text.white.make()
            ).h(50),
            // ignore: deprecated_member_use
            FlatButton.icon(
                onPressed:() => sendCoin(),
                color: Colors.green,
                shape: Vx.roundedSm,
                icon: Icon(Icons.call_made_outlined, color: Colors.white),
                label: "Deposit".text.white.make()
            ).h(50),
            // ignore: deprecated_member_use
            FlatButton.icon(
                onPressed:() => withdrawCoin(),
                color: Colors.red,
                shape: Vx.roundedSm,
                icon: Icon(Icons.call_received_outlined, color: Colors.white),
                label: "Withdraw".text.white.make()
            ).h(50),
          ],
          alignment: MainAxisAlignment.spaceAround,
          axisSize: MainAxisSize.max,
          ).p16(),
          if(txHash != null)
           txHash.text.black.makeCentered().p16()
        ])
      ])
    );
  }
}

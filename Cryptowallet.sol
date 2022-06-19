{\rtf1\ansi\ansicpg1251\cocoartf2580
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;}
{\colortbl;\red255\green255\blue255;\red79\green123\blue61;\red26\green26\blue41;\red172\green172\blue193;
\red70\green137\blue204;\red212\green212\blue212;\red167\green197\blue152;\red194\green126\blue101;\red45\green175\blue118;
\red237\green114\blue173;\red13\green102\blue149;\red31\green133\blue64;\red14\green86\blue166;\red76\green167\blue134;
}
{\*\expandedcolortbl;;\cssrgb\c37647\c54510\c30588;\cssrgb\c13333\c13725\c21176;\cssrgb\c72941\c73333\c80000;
\cssrgb\c33725\c61176\c83922;\cssrgb\c86275\c86275\c86275;\cssrgb\c70980\c80784\c65882;\cssrgb\c80784\c56863\c47059;\cssrgb\c19608\c72941\c53725;
\cssrgb\c95294\c54118\c73333;\cssrgb\c0\c47843\c65098;\cssrgb\c12941\c58039\c31765;\cssrgb\c3137\c42353\c70980;\cssrgb\c35686\c70588\c59608;
}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\sl360\partightenfactor0

\f0\fs24 \cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 // SPDX-License-Identifier: GPL-3.0\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf5 \cb3 \strokec5 pragma\cf4 \strokec4  \cf5 \strokec5 solidity\cf4 \strokec4  \cf6 \strokec6 ^\cf7 \strokec7 0.8.7\cf6 \strokec6 ;\cf4 \cb1 \strokec4 \
\
\pard\pardeftab720\sl360\partightenfactor0
\cf2 \cb3 \strokec2 // Get the latest ETH/USD price from chainlink price feed\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf5 \cb3 \strokec5 import\cf4 \strokec4  \cf8 \strokec8 "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol"\cf6 \strokec6 ;\cf4 \cb1 \strokec4 \
\
\cf5 \cb3 \strokec5 contract\cf4 \strokec4  CryptoWallet \cf6 \strokec6 \{\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf4 \cb3     \cf5 \strokec5 address\cf4 \strokec4  \cf9 \strokec9 payable\cf6 \strokec6 []\cf4 \strokec4  recipients\cf6 \strokec6 ;\cf4 \cb1 \strokec4 \
\cb3     \cf5 \strokec5 address\cf4 \strokec4  \cf9 \strokec9 public\cf4 \strokec4  owner\cf6 \strokec6 ;\cf4 \cb1 \strokec4 \
\
\cb3     \cf10 \strokec10 constructor\cf6 \strokec6 ()\cf4 \strokec4  \cf6 \strokec6 \{\cf4 \cb1 \strokec4 \
\cb3         owner \cf6 \strokec6 =\cf4 \strokec4  \cf11 \strokec11 msg\cf6 \strokec6 .\cf4 \strokec4 sender\cf6 \strokec6 ;\cf4 \cb1 \strokec4 \
\cb3     \cf6 \strokec6 \}\cf4 \cb1 \strokec4 \
\
\cb3     \cf5 \strokec5 function\cf4 \strokec4  getBalance\cf6 \strokec6 ()\cf4 \strokec4  \cf9 \strokec9 public\cf4 \strokec4  \cf9 \strokec9 view\cf4 \strokec4  \cf12 \strokec12 returns\cf6 \strokec6 (\cf5 \strokec5 uint256\cf6 \strokec6 )\{\cf4 \cb1 \strokec4 \
\cb3         \cf12 \strokec12 return\cf4 \strokec4  \cf5 \strokec5 address\cf6 \strokec6 (\cf13 \strokec13 this\cf6 \strokec6 ).\cf4 \strokec4 balance\cf6 \strokec6 ;\cf4 \cb1 \strokec4 \
\cb3     \cf6 \strokec6 \}\cf4 \cb1 \strokec4 \
\
\cb3     \cf5 \strokec5 function\cf4 \strokec4  send_ETH\cf6 \strokec6 (\cf5 \strokec5 address\cf4 \strokec4  \cf9 \strokec9 payable\cf4 \strokec4  recipient\cf6 \strokec6 )\cf4 \strokec4  \cf9 \strokec9 payable\cf4 \strokec4  \cf9 \strokec9 public\cf4 \strokec4  \cf6 \strokec6 \{\cf4 \cb1 \strokec4 \
\cb3         fund\cf6 \strokec6 (\cf4 \strokec4 recipient\cf6 \strokec6 );\cf4 \cb1 \strokec4 \
\cb3     \cf6 \strokec6 \}\cf4 \cb1 \strokec4 \
\cb3    \cb1 \
\cb3     \cf5 \strokec5 function\cf4 \strokec4  fund\cf6 \strokec6 (\cf5 \strokec5 address\cf4 \strokec4  \cf9 \strokec9 payable\cf4 \strokec4  recipient\cf6 \strokec6 )\cf4 \strokec4  \cf9 \strokec9 internal\cf4 \strokec4  \cf6 \strokec6 \{\cf4 \cb1 \strokec4 \
\cb3         recipient\cf6 \strokec6 .\cf4 \strokec4 transfer\cf6 \strokec6 (\cf5 \strokec5 address\cf6 \strokec6 (\cf13 \strokec13 this\cf6 \strokec6 ).\cf4 \strokec4 balance\cf6 \strokec6 );\cf4 \cb1 \strokec4 \
\cb3     \cf6 \strokec6 \}\cf4 \cb1 \strokec4 \
\
\cb3     \cf5 \strokec5 function\cf4 \strokec4  getPrice\cf6 \strokec6 ()\cf4 \strokec4  \cf9 \strokec9 public\cf4 \strokec4  \cf9 \strokec9 view\cf4 \strokec4  \cf12 \strokec12 returns\cf6 \strokec6 (\cf5 \strokec5 uint256\cf6 \strokec6 )\{\cf4 \cb1 \strokec4 \
\cb3         AggregatorV3Interface priceFeed \cf6 \strokec6 =\cf4 \strokec4  AggregatorV3Interface\cf6 \strokec6 (\cf14 \strokec14 0x8A753747A1Fa494EC906cE90E9f37563A8AF630e\cf6 \strokec6 );\cf4 \cb1 \strokec4 \
\cb3         \cf6 \strokec6 (,\cf5 \strokec5 int256\cf4 \strokec4  answer\cf6 \strokec6 ,,,)\cf4 \strokec4  \cf6 \strokec6 =\cf4 \strokec4  priceFeed\cf6 \strokec6 .\cf4 \strokec4 latestRoundData\cf6 \strokec6 ();\cf4 \cb1 \strokec4 \
\cb3          \cf2 \strokec2 // ETH/USD rate in 18 digit \cf4 \cb1 \strokec4 \
\cb3          \cf12 \strokec12 return\cf4 \strokec4  \cf5 \strokec5 uint256\cf6 \strokec6 (\cf4 \strokec4 answer \cf6 \strokec6 *\cf4 \strokec4  \cf7 \strokec7 10000000000\cf6 \strokec6 );\cf4 \cb1 \strokec4 \
\cb3     \cf6 \strokec6 \}\cf4 \cb1 \strokec4 \
\
\cb3     \cf5 \strokec5 function\cf4 \strokec4  getConversionRate\cf6 \strokec6 (\cf5 \strokec5 uint256\cf4 \strokec4  ethAmount\cf6 \strokec6 )\cf4 \strokec4  \cf9 \strokec9 public\cf4 \strokec4  \cf9 \strokec9 view\cf4 \strokec4  \cf12 \strokec12 returns\cf4 \strokec4  \cf6 \strokec6 (\cf5 \strokec5 uint256\cf6 \strokec6 )\{\cf4 \cb1 \strokec4 \
\cb3         \cf5 \strokec5 uint256\cf4 \strokec4  ethPrice \cf6 \strokec6 =\cf4 \strokec4  getPrice\cf6 \strokec6 ();\cf4 \cb1 \strokec4 \
\cb3         \cf5 \strokec5 uint256\cf4 \strokec4  ethAmountInUsd \cf6 \strokec6 =\cf4 \strokec4  \cf6 \strokec6 (\cf4 \strokec4 ethPrice \cf6 \strokec6 *\cf4 \strokec4  ethAmount\cf6 \strokec6 )\cf4 \strokec4  \cf6 \strokec6 /\cf4 \strokec4  \cf7 \strokec7 1000000000000000000\cf6 \strokec6 ;\cf4 \cb1 \strokec4 \
\cb3         \cf2 \strokec2 // the actual ETH/USD conversation rate, after adjusting the extra 0s.\cf4 \cb1 \strokec4 \
\cb3         \cf12 \strokec12 return\cf4 \strokec4  ethAmountInUsd\cf6 \strokec6 ;\cf4 \cb1 \strokec4 \
\cb3     \cf6 \strokec6 \}\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf6 \cb3 \strokec6 \}\cf4 \cb1 \strokec4 \
}
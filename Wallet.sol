{\rtf1\ansi\ansicpg1251\cocoartf2580
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;}
{\colortbl;\red255\green255\blue255;\red79\green123\blue61;\red26\green26\blue41;\red172\green172\blue193;
\red70\green137\blue204;\red167\green197\blue152;\red212\green212\blue212;\red237\green114\blue173;\red45\green175\blue118;
\red31\green133\blue64;}
{\*\expandedcolortbl;;\cssrgb\c37647\c54510\c30588;\cssrgb\c13333\c13725\c21176;\cssrgb\c72941\c73333\c80000;
\cssrgb\c33725\c61176\c83922;\cssrgb\c70980\c80784\c65882;\cssrgb\c86275\c86275\c86275;\cssrgb\c95294\c54118\c73333;\cssrgb\c19608\c72941\c53725;
\cssrgb\c12941\c58039\c31765;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\sl360\partightenfactor0

\f0\fs24 \cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 // SPDX-License-Identifier: GPL-3.0\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf5 \cb3 \strokec5 pragma\cf4 \strokec4  \cf5 \strokec5 solidity\cf4 \strokec4  \cf6 \strokec6 0.8.7\cf7 \strokec7 ;\cf4 \cb1 \strokec4 \
\
\cf5 \cb3 \strokec5 contract\cf4 \strokec4  Wallet\cf7 \strokec7 \{\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf4 \cb3     \cf5 \strokec5 int\cf4 \strokec4  balance\cf7 \strokec7 ;\cf4 \cb1 \strokec4 \
\
\cb3     \cf8 \strokec8 constructor\cf7 \strokec7 ()\cf4 \strokec4  \cf7 \strokec7 \{\cf4 \cb1 \strokec4 \
\cb3         balance \cf7 \strokec7 =\cf4 \strokec4  \cf6 \strokec6 0\cf7 \strokec7 ;\cf4 \cb1 \strokec4 \
\cb3     \cf7 \strokec7 \}\cf4 \cb1 \strokec4 \
\
\cb3     \cf5 \strokec5 function\cf4 \strokec4  getBalance\cf7 \strokec7 ()\cf4 \strokec4  \cf9 \strokec9 view\cf4 \strokec4  \cf9 \strokec9 public\cf4 \strokec4  \cf10 \strokec10 returns\cf7 \strokec7 (\cf5 \strokec5 int\cf7 \strokec7 )\{\cf4 \cb1 \strokec4 \
\cb3         \cf10 \strokec10 return\cf4 \strokec4  balance\cf7 \strokec7 ;\cf4 \cb1 \strokec4 \
\cb3     \cf7 \strokec7 \}\cf4 \cb1 \strokec4 \
\
\cb3     \cf5 \strokec5 function\cf4 \strokec4  depositBalance\cf7 \strokec7 (\cf5 \strokec5 int\cf4 \strokec4  amount\cf7 \strokec7 )\cf4 \strokec4  \cf9 \strokec9 public\cf7 \strokec7 \{\cf4 \cb1 \strokec4 \
\cb3         balance \cf7 \strokec7 =\cf4 \strokec4  balance \cf7 \strokec7 +\cf4 \strokec4  amount\cf7 \strokec7 ;\cf4 \cb1 \strokec4 \
\cb3     \cf7 \strokec7 \}\cf4 \cb1 \strokec4 \
\
\cb3     \cf5 \strokec5 function\cf4 \strokec4  withdrawBalance\cf7 \strokec7 (\cf5 \strokec5 int\cf4 \strokec4  amount\cf7 \strokec7 )\cf4 \strokec4  \cf9 \strokec9 public\cf7 \strokec7 \{\cf4 \cb1 \strokec4 \
\cb3         balance \cf7 \strokec7 =\cf4 \strokec4  balance \cf7 \strokec7 -\cf4 \strokec4  amount\cf7 \strokec7 ;\cf4 \cb1 \strokec4 \
\cb3     \cf7 \strokec7 \}\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf7 \cb3 \strokec7 \}\cf4 \cb1 \strokec4 \
}
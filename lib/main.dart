import 'package:bytebank/screens/transfer/list.dart';
import 'package:flutter/material.dart';

void main() => runApp(const ByteBankApp());

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: ListTransfer(),
      ),
    );
  }
}

/*
CardTransferInfo(Transfer(666.69, 'Devil bread')),
CardTransferInfo(Transfer(42.00, 'The answer, my friend.')),
CardTransferInfo(Transfer(7.00, 'The Old and the New')),
* */
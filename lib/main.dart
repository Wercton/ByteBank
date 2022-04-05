import 'package:flutter/material.dart';

void main() => runApp(const ByteBankApp());

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: TransferForm(),
      ),
    );
  }
}

class TransferForm extends StatelessWidget {
  const TransferForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criando transferência')),
    );
  }
}

class ListTransfer extends StatelessWidget {
  const ListTransfer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ByteBank')),
      body: Column(
        children: [
          CardTransferInfo(Transfer(666.69, 'Devil bread')),
          CardTransferInfo(Transfer(42.00, 'The answer, my friend.')),
          CardTransferInfo(Transfer(7.00, 'The Old and the New')),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}

class CardTransferInfo extends StatelessWidget {

  final Transfer _transfer;

  CardTransferInfo(this._transfer);  // alt + ins

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on_outlined),
        title: Text(_transfer.value.toString()),
        subtitle: Text(_transfer.transferDescription),
      ),
    );
  }

}

class Transfer {
  final double value;
  final String transferDescription;

  Transfer(this.value, this.transferDescription);
}
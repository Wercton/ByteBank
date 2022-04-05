import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: const Color(0xff00BCD1),
          body: ListTransfer(),
          appBar: AppBar(title: const Text('ByteBank')),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {},
          ),
        ),
      ),
    );

class ListTransfer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        CardTransferInfo(Transfer(666.69, 'Devil bread')),
        CardTransferInfo(Transfer(42.00, 'The answer, my friend.')),
        CardTransferInfo(Transfer(7.00, 'The Old and the New')),
      ],
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
import 'package:flutter/material.dart';

import '../../models/transfer.dart';
import 'form.dart';

const _appName = 'ByteBank';

class ListTransfer extends StatefulWidget {
  final List<Transfer> _lstTransfers = [];

  @override
  State<StatefulWidget> createState() {
    return ListTransferState();
  }
}

class ListTransferState extends State<ListTransfer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_appName)),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: widget._lstTransfers.length,
        itemBuilder: (context, index) {
          return CardTransferInfo(widget._lstTransfers[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final Future<Transfer?> transferNew =
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TransferForm();
          }));

          transferNew.then((transferReceived) => update(transferReceived));
        },
      ),
    );
  }

  void update(Transfer? transferReceived) {
    if (transferReceived != null) {
      setState(() {
        widget._lstTransfers.add(transferReceived);
      });
    }
  }
}

class CardTransferInfo extends StatelessWidget {
  final Transfer _transfer;

  CardTransferInfo(this._transfer); // alt + ins

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

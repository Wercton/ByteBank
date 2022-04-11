import 'package:flutter/material.dart';

void main() => runApp(const ByteBankApp());

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      appBar: AppBar(
        title: const Text('ByteBank'),
        backgroundColor: const Color(0xffb74093),
      ),
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

          transferNew.then((transferReceived) {
            debugPrint('$transferReceived');
            if (transferReceived != null) {
              debugPrint('???/???');
              setState(() {
                widget._lstTransfers.add(transferReceived);
              });
            }
          });
        },
      ),
    );
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

class TransferForm extends StatefulWidget {
  final TextEditingController _TECTransferDescription = TextEditingController();
  final TextEditingController _TECValue = TextEditingController();


  void TransferEfetuation(BuildContext context) {
    final String strTransferDescription = _TECTransferDescription.text;
    final double? dblValue = double.tryParse(_TECValue.text);

    if (strTransferDescription != '' && dblValue != null) {
      final Transfer _createdTransfer =
          Transfer(dblValue, strTransferDescription);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('$_createdTransfer'),
      ));
      Navigator.pop(context, _createdTransfer);
    }
  }

  @override
  State<StatefulWidget> createState() {
    return TransferFormState();
  }
}

class TransferFormState extends State<TransferForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criando transferência'),
        backgroundColor: const Color(0xffb74093),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              strLabel: 'Transfer Description',
              strHint: 'Payment for reason x',
              controller: widget._TECTransferDescription,
            ),
            Editor(
              strLabel: 'Value',
              strHint: '0.00',
              controller: widget._TECValue,
              iconMoney: Icons.monetization_on_outlined,
              inputKeyboard: TextInputType.number,
            ),
            ElevatedButton(
              child: const Text('Ok'),
              onPressed: () => widget.TransferEfetuation(context),
            )
          ],
        ),
      ),
    );
  }
}

class Editor extends StatelessWidget {
  final String? strLabel;
  final String? strHint;
  final TextEditingController? controller;
  final IconData? iconMoney;
  final TextInputType? inputKeyboard;

  Editor(
      {this.strLabel,
      this.strHint,
      this.controller,
      this.iconMoney,
      this.inputKeyboard});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        style: const TextStyle(
          fontSize: 24,
        ),
        decoration: InputDecoration(
          icon: iconMoney != null ? Icon(iconMoney) : null,
          labelText: strLabel,
          hintText: strHint,
        ),
        controller: controller,
        keyboardType: inputKeyboard != null ? TextInputType.number : null,
      ),
    );
  }
}

class Transfer {
  final double value;
  final String transferDescription;

  Transfer(this.value, this.transferDescription);

  @override
  String toString() {
    return 'Transfer{value: $value, transferDescription: $transferDescription}';
  }
}

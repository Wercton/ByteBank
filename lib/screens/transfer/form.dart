import 'package:flutter/material.dart';

import '../../components/editor.dart';
import '../../models/transfer.dart';

const _strScreenName = 'New transfer';
const _strTransferDescription = 'Transfer Description';
const _strHintDescription = 'Payment for reason x';
const _strTransferValue = 'Value';
const _strHintValue = '0.00';

class TransferForm extends StatefulWidget {
  final TextEditingController _TECTransferDescription = TextEditingController();
  final TextEditingController _TECValue = TextEditingController();

  void TransferEfetuation(BuildContext context) {
    final String strTransferDescription = _TECTransferDescription.text;
    final double? dblValue = double.tryParse(_TECValue.text);

    if (strTransferDescription != '' && dblValue != null) {
      final Transfer _createdTransfer =
      Transfer(dblValue, strTransferDescription);
      /*ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('$_createdTransfer'),
      ));*/
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
      appBar: AppBar(title: const Text(_strScreenName)),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              strLabel: _strTransferDescription,
              strHint: _strHintDescription,
              controller: widget._TECTransferDescription,
            ),
            Editor(
              strLabel: _strTransferValue,
              strHint: _strHintValue,
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

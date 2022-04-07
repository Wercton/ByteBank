import 'package:flutter/material.dart';

void main() => runApp(const ByteBankApp());

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: TransferForm(),
      ),
    );
  }
}

class TransferForm extends StatelessWidget {
  final TextEditingController _TECTransferDescription = TextEditingController();
  final TextEditingController _TECValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criando transferência'),
        backgroundColor: const Color(0xffb74093),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: const TextStyle(
                fontSize: 24,
              ),
              decoration: const InputDecoration(
                labelText: 'Descrição da transferência',
                hintText: 'pagamento x pela razão y',
              ),
              controller: _TECTransferDescription,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: const TextStyle(
                fontSize: 24,
              ),
              decoration: const InputDecoration(
                  icon: Icon(Icons.monetization_on_outlined),
                  labelText: 'Valor',
                  hintText: '00,00'),
              keyboardType: TextInputType.number,
              controller: _TECValue,
            ),
          ),
          ElevatedButton(
            child: const Text('Ok'),
            onPressed: () {
              final String strTransferDescription =
                  _TECTransferDescription.text;
              final double? dblValue = double.tryParse(_TECValue.text);

              if (strTransferDescription != '' && dblValue != null) {
                final Transfer _createdTransfer =
                    Transfer(dblValue, strTransferDescription);
                debugPrint('$_createdTransfer');
              }
            },
          )
        ],
      ),
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

class Transfer {
  final double value;
  final String transferDescription;

  Transfer(this.value, this.transferDescription);

  @override
  String toString() {
    return 'Transfer{value: $value, transferDescription: $transferDescription}';
  }
}

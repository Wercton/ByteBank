import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment List'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: ListView(
        children: [
          PaymentCard('Odin', 12.50),
          PaymentCard('Loki', 27.00),
        ],
      ),
    );
  }
}

class PaymentCard extends StatelessWidget {
  String name;
  double value;

  PaymentCard(this.name, this.value);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          name,
          style: TextStyle(fontSize: 24),
        ),
        subtitle: Text(
          value.toString(),
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

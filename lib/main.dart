import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Color(0xff00BCD1),
          body: Column(
            children: [
              Card(
                child: ListTile(
                  leading:  const Icon(Icons.monetization_on_outlined),
                  title: Text('666,69'),
                  subtitle: Text('Devil bread'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.monetization_on_outlined),
                  title: Text('666,69'),
                  subtitle: Text('Devil bread'),
                ),
              ),
            ],
          ),
          appBar: AppBar(title: Text('ByteBank')),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {},
          ),
        ),
      ),
    );

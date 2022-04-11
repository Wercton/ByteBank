import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final String? strLabel;
  final String? strHint;
  final TextEditingController? controller;
  final IconData? iconMoney;
  final TextInputType? inputKeyboard;

  Editor({
    this.strLabel,
    this.strHint,
    this.controller,
    this.iconMoney,
    this.inputKeyboard,
  });

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

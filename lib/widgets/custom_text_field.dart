import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField( {
    super.key,
     required this.label,
     this.onChanged,
     this.type
     }
  );
  TextInputType ? type;
  Function (String)?onChanged ;
  String label;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: type,
      onChanged:onChanged ,
      decoration: InputDecoration(
        label: Text(label),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}

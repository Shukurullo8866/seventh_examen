import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class AddCardTextfieldString extends StatelessWidget {
  String name;
  String initialvalue;
  ValueChanged onChanged;
  String hintText;
  TextInputType txtType;
  AddCardTextfieldString(
      {super.key,
        this.initialvalue="",
        required this.name,
        required this.hintText,
        required this.onChanged,
        required this.txtType});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          child: Text(
            name,
            style: const TextStyle(color: Colors.blue),
          ),
        ),
        Container(
          height: 50,
          child: TextFormField(
            initialValue: initialvalue,
            keyboardType: txtType,
            onChanged: onChanged,
            decoration: InputDecoration(
                hintText: hintText,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
        ),
      ],
    );
  }
}

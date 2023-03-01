import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seventh_examen/service/widgets/text_inout_farmat.dart';

class AddCardTextfield extends StatelessWidget {
  String name;
  String initialvalue;
  ValueChanged onChanged;
  String hintText;
  TextInputType txtType;
  int? lenth;
  AddCardTextfield(
      {super.key,
        this.initialvalue="",
      required this.name,
         this.lenth,
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
          height: 60,
          child: TextFormField(
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              CardNumberFormatter(),
            ],
            initialValue: initialvalue,
            keyboardType: txtType,
            onChanged: onChanged,
            maxLength: lenth,
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

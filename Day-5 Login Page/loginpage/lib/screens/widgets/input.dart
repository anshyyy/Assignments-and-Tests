import 'package:flutter/material.dart';

class PlainInput extends StatelessWidget {
  String label;
  String hintText;
  bool ObscureText;
  PlainInput(
      {super.key,
      required this.hintText,
      required this.label,
      this.ObscureText = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        const SizedBox(height: 5),
        TextField(
          keyboardType: TextInputType.text,
          obscureText: ObscureText,
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.grey)),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

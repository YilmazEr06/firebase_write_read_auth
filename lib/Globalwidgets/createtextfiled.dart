import 'package:flutter/material.dart';

class CreateTextFieldwidget extends StatelessWidget {


  const CreateTextFieldwidget({
    super.key,
    required this.controller,
     required this.labelText, 
     required this.validator,
    

  });
  final dynamic Function(String? value) validator;
  final TextEditingController controller;
  final String labelText;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration:  InputDecoration(
         fillColor: const Color.fromARGB(255, 252, 251, 251),
      filled: true,
        border: const OutlineInputBorder(
          borderSide:
              BorderSide(color: Colors.lightBlueAccent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        labelText:labelText,
      ),
      validator:  (value) => validator(value),
    );
  }
}

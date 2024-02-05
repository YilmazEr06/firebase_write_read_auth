import 'package:firebase_write_read_auth/Globalwidgets/createtextfiled.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyCustomForm extends StatelessWidget {
  final void Function(BuildContext context, String controlleremail,
      String controllerpassword) loginoperaiton;
  MyCustomForm(this.loginoperaiton, {super.key});

  final _formKey = GlobalKey<FormState>();

  late TextEditingController controlleremail;

  late TextEditingController controllerpassword;

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKe
    //y created above.
    controlleremail = TextEditingController();
    controllerpassword = TextEditingController();

    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Text("Login screen", style: TextStyle(fontSize: 30)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
            child: CreateTextFieldwidget(
              controller: controlleremail,
              validator: (value) {
                return (value != null && !value.contains('@'))
                    ? 'Nerde benim @ im?'
                    : value!.isEmpty
                        ? "Doldur ulen"
                        : null;
              },
              labelText: 'Enter your Email',
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: CreateTextFieldwidget(
              controller: controllerpassword,
              labelText: 'Enter your password',
              validator: (value) {
                return (value!.isEmpty)
                    ? 'Doldur ulen'
                    : (value.length < 6)
                        ? "Az oldu bu doldur"
                        : null;
              },
            ),
          ),
          RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.black),
              children: <TextSpan>[
                const TextSpan(text: "Hesabınız yokmu? Hemen "),
                TextSpan(
                    text: 'kaydolun',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, "/signupscreen");
                      }),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: ElevatedButton(
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 255, 253, 253)),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 134, 132, 132)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 223, 217, 216))))),
              child: const Text("Giriş", style: TextStyle(fontSize: 30)),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Giriş yapılıyor')),
                  );
                  loginoperaiton(
                      context, controlleremail.text, controllerpassword.text);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

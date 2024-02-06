import 'package:firebase_write_read_auth/Globalwidgets/createtextfiled.dart';
import 'package:firebase_write_read_auth/models/user.dart';
import 'package:firebase_write_read_auth/screens/signuppage/companents/datepicker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyCustomsignupForm extends StatefulWidget {
  final void Function(BuildContext context,Usermodel user) signoperation;
  const MyCustomsignupForm(this.signoperation, {super.key});

  @override
  State<MyCustomsignupForm> createState() => _MyCustomsignupFormState();
}

class _MyCustomsignupFormState extends State<MyCustomsignupForm> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController controlleremail;

  late TextEditingController controllerpassword;

  late TextEditingController controllerpasswordagain;

  late TextEditingController controlleusername;

  late TextEditingController controllerlastname;
  
  late TextEditingController controllerdatetime;

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKe
    //y created above.
    controlleremail = TextEditingController();
    controllerpassword = TextEditingController();
    controllerpasswordagain = TextEditingController();
    controlleusername = TextEditingController();
    controllerlastname = TextEditingController();
    controllerdatetime = TextEditingController();
     

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[     
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Text("Signup ",
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 59, 59, 59))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: CreateTextFieldwidget(
                controller: controlleusername,
                labelText: "Enter your user name",
                validator: (value) {
                  return (value!.isEmpty)?"Doldur ulen":((value.length>3)?null:"Çok kısa");
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: CreateTextFieldwidget(
                controller: controllerlastname,
                labelText: "Enter your last name",
                validator: (value) {
                  (value!.isEmpty)?"Doldur ulen":((value.length>2)?null:"Çok kısa");
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: CreateTextFieldwidget(
                controller: controlleremail,
                labelText: "Enter your email",
                validator: (value) {
                    return (value != null && !value.contains('@'))
                      ? 'Nerde benim @ im?'
                      : value!.isEmpty
                          ? "Doldur ulen"
                          : null;
                },
              ),
            ),
              Padding(
              padding: const  EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: datepicker(controller: controllerdatetime ,)
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: CreateTextFieldwidget(
                controller: controllerpassword,
                labelText: "Enter your password",
                validator: (value) {
                  return (value!.isEmpty)
                      ? 'Doldur ulen'
                      : (value.length < 6)
                          ? "Az oldu bu doldur"
                          : null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: CreateTextFieldwidget(
                controller: controllerpasswordagain,
                labelText: "Enter your password again",
                validator: (value) {
                  return (value!.isEmpty)
                      ? 'Doldur ulen': (controllerpassword.text==value)?null: "Şifreler uyuşmuyor";
                      
                },
              ),
            ),
            RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black),
                children: <TextSpan>[
                  const TextSpan(text: "Hesabınız varmı? Hemen "),
                  TextSpan(
                      text: 'giriş yapın',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.popAndPushNamed(context, "/loginscreen");
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
                        widget.signoperation(context, Usermodel(name: controlleusername.text,
                           surname: controllerlastname.text, 
                           email: controlleremail.text, 
                           password: controllerpassword.text,
                           birthday: controllerdatetime.text
                           )
                           );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      
    );
    
  }
}


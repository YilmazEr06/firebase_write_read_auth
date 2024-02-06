// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
class datepicker extends StatefulWidget {
  const datepicker({
    super.key,required  this.controller
  });
  final TextEditingController controller;
  @override
  State<datepicker> createState() => _datepickerState();
}

class _datepickerState extends State<datepicker> {
 
  @override
  void initState() {
    // TODO: implement initState
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    void select() async{
  DateTime? a=  await  showDatePicker(
      initialDate: DateTime.now(),
      context: context, 
      firstDate: DateTime(2000), 
      lastDate: DateTime(2100),

      );


      if (a!=null){
        setState(() {
          
         widget.controller.text= a.toString().split(" ")[0];
        });

        print(a.toString().split(" ")[0]);
      }
  }
    return TextField(
  
      controller: widget.controller,
      onTap: () => select(),
      readOnly: true,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderSide:
    BorderSide(color: Colors.lightBlueAccent, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
        
        ),
      
        label: Text("Select birthday"),
        
        fillColor: Color.fromARGB(255, 252, 251, 251) ,
        filled: true,
        prefixIcon: Icon(Icons.calendar_month),
       
        focusedBorder: OutlineInputBorder(
          borderSide:
                 BorderSide(color: Color.fromARGB(255, 67, 48, 236)),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
        
        ),
        
        
        ),
    );
  }
}

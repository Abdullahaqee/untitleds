import 'package:flutter/material.dart';

TextField inputFrom(String Text, IconData icon,bool passwordType,TextEditingController controller){
  return TextField(
    controller: controller,
    obscureText: passwordType,
    autocorrect: !passwordType,
    cursorColor: Colors.black,
    style: TextStyle(
      color: Colors.black,),
    decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.black,),
        labelText: Text,
        labelStyle: TextStyle(color: Colors.black.withOpacity(0.8)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(width: 0,style: BorderStyle.none),
        )
    ),
  );
}

Container submitbutton(BuildContext context, bool isSignin, Function ontap){
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
    ),
    child: ElevatedButton(
      onPressed: () {
        ontap();

      },
      child: Text(isSignin? 'Sign in' : 'Sign up',style: TextStyle(color: Colors.cyan,fontWeight: FontWeight.w300),),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if(states.contains(MaterialState.pressed)) {
            return Colors.grey[100];
          }
          return Colors.white;
        }),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      ),
    ),
  );
}
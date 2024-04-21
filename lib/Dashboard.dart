import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Login.dart';


class Bashboard extends StatefulWidget{
  @override
  State<Bashboard> createState() => _BashboardState();
}

class _BashboardState extends State<Bashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: IconButton(onPressed: () {
          FirebaseAuth.instance.signOut().then((value) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Signin()));
          });
        }, icon: Icon(Icons.logout_sharp),

        )
    );
  }
}
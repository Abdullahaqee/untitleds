import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class adminlogin extends StatefulWidget{
  @override
  State<adminlogin> createState() => _adminloginState();
}

class _adminloginState extends State<adminlogin> {

  final GlobalKey<FormState> fromkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/2),
              padding: EdgeInsets.only(top: 45,left: 20,right: 20),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 53, 51, 51),Colors.black],
                    begin: Alignment.topLeft,end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.vertical(
                  top: Radius.elliptical(MediaQuery.of(context).size.width,110.0),

                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30,right: 30,top: 60),
              child: Form(key: fromkey,
              child: Stack(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Admin.dart';

class adminlogin extends StatefulWidget{
  @override
  State<adminlogin> createState() => _adminloginState();
}

class _adminloginState extends State<adminlogin> {

  final GlobalKey<FormState> fromkey = GlobalKey<FormState>();
  TextEditingController usercontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
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
              child: Column(
                children: [
                  Text('start with the Admin',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),),
                  SizedBox(height: 30,),
                  Material(
                    elevation: 3.0,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: MediaQuery.of(context).size.height/2.2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 20,),
                          Container(
                            padding: EdgeInsets.only(left: 20.0),
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              border: Border.all(color: Color.fromARGB(25, 45, 40, 40))
                            ),
                            child: (
                            TextFormField(
                              controller: usercontroller,
                              validator: (value){
                                if (value == null || value.isEmpty){
                                  return  'please enter username';
                                }
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Username',
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 160, 160, 147),
                                )

                              ),
                            )
                            ),
                          ),
                          SizedBox(height: 40.0),
                          Container(
                            padding: EdgeInsets.only(left: 20.0),
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                                border: Border.all(color: Color.fromARGB(25, 45, 40, 40))
                            ),
                            child: (
                                TextFormField(
                                  controller: passwordcontroller,
                                  validator: (value){
                                    if (value == null || value.isEmpty){
                                      return  'please enter username';
                                    }
                                  },
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Passwprd',
                                      hintStyle: TextStyle(
                                        color: Color.fromARGB(255, 160, 160, 147),
                                      )
                                  ),
                                )
                            ),
                          ),
                          SizedBox(height: 40.0),
                          GestureDetector(
                            onTap: (){
                              loginAdmin();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 12.0),
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text('Login',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
                              ),
                            ),
                          )

                        ],
                      ),
                    ),
                  )
                ],
              )
              ),
            )
          ],
        ),
      ),
    );
  }
  loginAdmin(){
    FirebaseFirestore.instance.collection('Admin').get().then((snapshot){
      snapshot.docs.forEach((result){
        if(result.data()['id']!=usercontroller.text.trim()){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('id is incorrect',style: TextStyle(fontSize: 18),
              ),backgroundColor: Colors.orangeAccent,));
        } else  if (result.data()['password']!=passwordcontroller.text.trim()){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Password is incorrect',style: TextStyle(fontSize: 18),
            ),backgroundColor: Colors.orangeAccent,));
        } else {
          Route route = MaterialPageRoute(builder: (context)=> adminpage());
          Navigator.pushReplacement(context, route);
        }
      }
      );
    });
  }

}
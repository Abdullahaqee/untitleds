import 'package:flutter/material.dart';
import 'package:untitled/Data1.dart';


class adminpage extends StatefulWidget {
  @override
  State<adminpage> createState() => _adminpageState();
}

class _adminpageState extends State<adminpage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 20,right: 20,top: 50),
        child: Column(
          children: [
            Center(child: Text('admin Page',),),
            SizedBox(height: 50,),
            GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>data1()));
              },
              child: Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(10),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black
                    ),
                    child: Row(
                      children: [
                        Padding(padding: EdgeInsets.all(6.0),
                          child: Image.asset('assets/images/abc.jpg',height: 100,width: 100,fit: BoxFit.cover,),
                        ),
                        SizedBox(width: 30.0,),
                        Text('add picture',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),

      ),
    );
  }
}

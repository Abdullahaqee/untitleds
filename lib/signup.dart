import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:untitled/auth.dart';
import 'Login.dart';
import 'allwidget.dart';

class signup extends StatefulWidget {
  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController usercon = TextEditingController();
  TextEditingController passwprdcon = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: MediaQuery
              .of(context)
              .size
              .height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.cyan, Colors.white60],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 150, 20, 40),
            child: Column(
              children: [
                Gap(40),
                Text('Sign up', style: TextStyle(color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w600),),
                Gap(40),
                inputFrom('Enter Username', Icons.person_outline, false, usercon),
                Gap(20),
                inputFrom('Enter Email',Icons.email_outlined,false,email),
                Gap(20),
                inputFrom(
                    'Enter Password', Icons.lock_outlined, false, passwprdcon),
                Gap(30),
              submitbutton(context, false, () async {
                bool registered = await auth.instance.registor(
                  email.text.trim(),
                  passwprdcon.text.trim(),
                );
        
                if (registered) {
                  // If registration is successful, navigate to the login page
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => loginn()),
                  );
                } else {
                  // Show toast message indicating registration failed
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Registration failed'),
                    ),
                  );
                }
              }),
        
        
              Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Not registor yet?', style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w200),),
                    InkWell(
                      child: Text(
                        'Login', style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w300),
                      ),
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => loginn()));
                        //   });
                        // });
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
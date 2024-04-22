import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:untitled/auth.dart';
import 'package:untitled/signup.dart';
import 'Dashboard.dart';
import 'allwidget.dart';

class loginn extends StatefulWidget {
  @override
  State<loginn> createState() => _loginnState();
}

class _loginnState extends State<loginn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.cyan, Colors.white60],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 150, 20, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Gap(20),
                Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gap(20),
                inputFrom(
                  'Enter Email',
                  Icons.email_outlined,
                  false,
                  emailController,
                ),
                Gap(20),
                inputFrom(
                  'Enter Password',
                  Icons.lock_outlined,
                  true,
                  passwordController,
                ),
                Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    InkWell(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.grey[100],
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => signup()),
                        );
                      },
                    ),
                  ],
                ),
                Gap(40),
                submitbutton(context, false, () async {
                  bool loggedIn = await auth.instance.login(
                    emailController.text.trim(),
                    passwordController.text.trim(),
                  );

                  if (loggedIn) {
                    // Navigate to Dashboard if login is successful
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Dashboard()));
                  } else {
                    // Show toast message indicating incorrect email or password
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Incorrect email or password'),
                      ),
                    );
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

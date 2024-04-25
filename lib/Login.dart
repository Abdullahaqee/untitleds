import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
  // final FirebaseAuth _auth = FirebaseAuth.instance;

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
                  'Log In',
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
                submitButton(
                  context,
                  false,
                      () async {
                    bool loggedIn = await auth.instance.login(
                      emailController.text.trim(),
                      passwordController.text.trim(),
                    );

                    if (loggedIn) {
                      // Navigate to Dashboard if login is successful
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Dashboard()),
                      );
                    } else {
                      // Show toast message indicating incorrect email or password
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Incorrect email or password'),
                        ),
                      );
                    }
                  },
                  buttonText: 'Login', // Specify 'Login' as the button text
                ),
                // Gap(10),
                // ElevatedButton(
                //   onPressed: () async {
                //     bool loggedIn = await _signInWithGoogle();
                //
                //     if (loggedIn) {
                //       Navigator.pushReplacement(
                //         context,
                //         MaterialPageRoute(builder: (context) => Dashboard()),
                //       );
                //     } else {
                //       ScaffoldMessenger.of(context).showSnackBar(
                //         SnackBar(
                //           content: Text('Google Sign-In failed'),
                //         ),
                //       );
                //     }
                //   },
                //   child: Text('Sign In with Google'),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Future<bool> _signInWithEmailAndPassword() async {
  //   try {
  //     await _auth.signInWithEmailAndPassword(
  //       email: emailController.text.trim(),
  //       password: passwordController.text.trim(),
  //     );
  //     return true;
  //   } catch (e) {
  //     print('Error signing in: $e');
  //     return false;
  //   }
  // }

  // Future<bool> _signInWithGoogle() async {
  //   try {
  //     final GoogleSignIn googleSignIn = GoogleSignIn();
  //     final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
  //     if(googleSignInAccount != null) {
  //       final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!
  //           .authentication;
  //
  //       final AuthCredential credential = GoogleAuthProvider.credential(
  //         accessToken: googleSignInAuthentication.accessToken,
  //         idToken: googleSignInAuthentication.idToken,
  //       );
  //
  //       await _auth.signInWithCredential(credential);
  //       Navigator.pushReplacement(
  //           context, MaterialPageRoute(builder: (context) => Dashboard()));
  //     }
  //     return true;
  //   } catch (e) {
  //     print('Error signing in with Google: $e');
  //     return false;
  //   }
  // }

  Widget submitButton(BuildContext context, bool isLoading, Function onPressed,
      {String buttonText = 'Signup'}) {
    return ElevatedButton(
      onPressed: () async {
        bool loggedIn = await auth.instance.login(
          emailController.text.trim(),
          passwordController.text.trim(),
        );

        if (loggedIn) {
          // Navigate to Dashboard if login is successful
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Dashboard()),
          );
        } else {
          // Show toast message indicating incorrect email or password
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Incorrect email or password'),
            ),
          );
        }
      },
      child: isLoading
          ? CircularProgressIndicator()
          : Text(buttonText), // Change 'Signup' to 'Login'
    );
  }
}

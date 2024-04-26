import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/signup.dart';

import 'Dashboard.dart';

class auth extends GetxController{
  //auth.instance...
  static auth instance = Get.find();
  //email , name , password etc....
  late Rx<User?> _user;
  FirebaseAuth aoth = FirebaseAuth.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('user');

  @override
  void onReady(){
    super.onReady();
    _user = Rx<User?>(aoth.currentUser);
    //our user will be notified
    _user.bindStream(aoth.userChanges());
    ever(_user, _initailScreen);
  }

  _initailScreen(User? user){
    if(user==null){
      print('loginpage');
      Get.offAll(()=>signup());
    }else {
      final userEmail = user.email ?? "No Email Available"; // Provide a default value
      Get.offAll(() => Dashboard());
    }
  }

  Future<bool> registor(String email, String password) async {
    try {
      await aoth.createUserWithEmailAndPassword(email: email, password: password).then((value){

        ref.child(value.user!.uid.toString()).set({
          'uid' : value.user!.uid.toString(),
          'email' : value.user!.email.toString(),
          'onlineStatus' : 'noONe',
          'phone' : '' ,
          // for username to be save  we need provider
          'username' : value.user!.displayName.toString(),
          'profile' : ''
        }).then((value){

        }).onError((error, stackTrace){

        });
      });

      return true;
    } catch (e) {
      Get.snackbar('About us', 'User massage',
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text("Account created fail",style: TextStyle(color: Colors.white),),
          messageText: Text(e.toString(),style: TextStyle(color: Colors.white),)
      );
      return false;
    }
  }

  Future <bool> login(String email, String password) async {
    try {
      await aoth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      Get.snackbar('About login', 'login massage',
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text("login fail",style: TextStyle(color: Colors.white),),
          messageText: Text(e.toString(),style: TextStyle(color: Colors.white),)
      );
      return false;
    }
  }
  void logout()async{
    await aoth.signOut();
  }
}
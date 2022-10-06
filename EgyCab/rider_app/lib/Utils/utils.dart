import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Utils{

  Utils._();

  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])");

  static bool validatePhone(String phone){
    String _phone = phone.trim();
    if(_phone.length == 11 && ((_phone.substring(0,3) == "011"
        || _phone.substring(0,3) == "012" || _phone.substring(0,3) == "010"
        || _phone.substring(0,3) == "015"))) {

      return true;
    } else {
      return false;
    }

  }

  static bool validatePassword(String pass){
    String _password = pass.trim();
    if(pass_valid.hasMatch(_password) && _password.length > 9){
      return true;
    }else{
      return false;
    }
  }

  static void showSnackBar(BuildContext context, String text){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(text),
      )
    );
  }

  static Future<void> sendEmailVerification(BuildContext context) async{
    try {
      FirebaseAuth.instance.currentUser!.sendEmailVerification();
      Utils.showSnackBar(context, "Email Verification sent!");
    } on FirebaseAuthException catch(e){
      Utils.showSnackBar(context, e.message!);
    }
  }

}
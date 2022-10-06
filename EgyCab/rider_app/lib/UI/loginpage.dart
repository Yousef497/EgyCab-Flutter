import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:rider_app/AllWidgets/progressDialog.dart';
import 'package:rider_app/UI/mainpage.dart';
import 'package:rider_app/UI/primaryscreen.dart';
import 'package:rider_app/UI/signuppage.dart';
import 'package:rider_app/main.dart';

import '../Utils/utils.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  static const String idScreen = "Login";

  final formKey = GlobalKey<FormState>();

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void signIn(BuildContext context) async {

    final isValid = formKey.currentState!.validate();
    if(!isValid)
      return;

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context){
          return ProgressDialog(message: "Authenticating, Please wait.",);
        }
    );

    final User? user = (await _firebaseAuth.signInWithEmailAndPassword(
        email: emailTextEditingController.text.trim(),
        password: passwordTextEditingController.text.trim()
      ).catchError((errMsg){
      Navigator.of(context).pop();
      Utils.showSnackBar(context, "Invalid Email or Password.");
      })
    ).user;

    if(user != null){
      userRef.child(user.uid).once().then((event) {
        final DataSnapshot snap = event.snapshot;
        if(snap.value != null){
          Navigator.of(context).pop();
          Navigator.pushNamedAndRemoveUntil(context, PrimaryScreen.idScreen, (route) => false);
          Utils.showSnackBar(context, "Logged In Succefully");
        }
        else {
          _firebaseAuth.signOut();
          Navigator.of(context).pop();
          Utils.showSnackBar(context, "This account does not exist.");
        }
      });

    } else {
      Navigator.of(context).pop();
      Utils.showSnackBar(context, "Cannot Sign In.");
    }

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,

        leading: IconButton(
          onPressed: (){
            Navigator.pushNamedAndRemoveUntil(context, MainPage.idScreen, (route) => false);
          },
          icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
          ),
        ),

      ),

      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      Image(
                        image: AssetImage('assets/images/Rider.png'),
                        height: MediaQuery.of(context).size.height/3,
                        width: MediaQuery.of(context).size.width/1.2,
                        alignment: Alignment.center,
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      Text(
                        "Login as a Rider",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 5,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: emailTextEditingController,
                            keyboardType: TextInputType.emailAddress,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (email) =>
                            email != null && EmailValidator.validate(email)
                                ? null
                                : "Enter a valid email",

                            decoration: InputDecoration(
                              labelText: "Email",
                              labelStyle: TextStyle(
                                fontSize: 14.0,
                              ),
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                              ),
                            ),
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),

                          TextFormField(
                            controller: passwordTextEditingController,
                            obscureText: true,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if(value!.isEmpty){
                                return "Please Enter a Password";
                              } else {
                                bool result = Utils.validatePassword(value);
                                if(result){
                                  return null;
                                }
                                else{
                                  return "Password must be 9 characters or more and"
                                      "\nshould contain Capital, small letters"
                                      "\nand Numbers.";
                                }
                              }
                            },
                            decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: TextStyle(
                                fontSize: 14.0,
                              ),
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                              ),
                            ),
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        color: Colors.blueGrey[200],
                        onPressed: () {
                          signIn(context);
                        },

                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Colors.black
                          ),
                          borderRadius: BorderRadius.circular(50)
                        ),

                        child: const Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            //color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),

                  TextButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(context, SignUpPage.idScreen, (route) => false);
                    },
                    child: const Text(
                      "Do not have an Account? Sign Up Now."
                    ),
                  ),

                ],
              ),



            ],

          ),

        ),
      ),

    );
  }

}

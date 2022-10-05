import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:rider_app/UI/loginpage.dart';
import 'package:rider_app/UI/mainpage.dart';
import 'package:rider_app/main.dart';

import '../utils.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  static const String idScreen = "SignUp";
  //DatabaseReference dbref = FirebaseDatabase.instance.ref().child('Users');

  //RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  final formKey = GlobalKey<FormState>();

  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  Future<void> signUp(BuildContext context) async {

    final isValid = formKey.currentState!.validate();
    if(!isValid)
      return;

    //print("Sign UP");

    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailTextEditingController.text.trim(),
        password: passwordTextEditingController.text.trim(),
      );
      await Utils.sendEmailVerification(context);

      final User? user = FirebaseAuth.instance.currentUser;

      Map userDataMap = {
        "name": nameTextEditingController.text.trim(),
        "email": emailTextEditingController.text.trim(),
        "phone": phoneTextEditingController.text.trim(),
      };

      userRef.child(user!.uid).set(userDataMap);
      Utils.showSnackBar(context, "Congratulations, Account Created Succefully");
      Navigator.pushNamedAndRemoveUntil(context, MainPage.idScreen, (route) => false);

    } on FirebaseAuthException catch (e){
      print(e);
      Utils.showSnackBar(context, e.message!);
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
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      Image(
                        image: AssetImage('assets/images/Rider.png'),
                        height: MediaQuery.of(context).size.height/4,
                        width: MediaQuery.of(context).size.width/1.7,
                        alignment: Alignment.center,
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      Text(
                        "Register as a Rider",
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
                            controller: nameTextEditingController,
                            keyboardType: TextInputType.text,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if(value!.isEmpty || value.length < 3){
                                return "Please Enter a valid Name";
                              } else {
                                return null;
                              }
                            },

                            decoration: InputDecoration(
                              labelText: "Name",
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
                            controller: phoneTextEditingController,
                            keyboardType: TextInputType.phone,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if(value!.isEmpty){
                                return "Please Enter Your Phone Number";
                              } else {
                                bool result = Utils.validatePhone(value);
                                if(result){
                                  return null;
                                }
                                else{
                                  return "Please enter a Valid Phone Number in Egypt";
                                }
                              }
                            },

                            decoration: InputDecoration(
                              labelText: "Phone",
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
                          //print("Sign Up");
                          signUp(context);
                        },

                        shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                color: Colors.black
                            ),
                            borderRadius: BorderRadius.circular(50)
                        ),

                        child: const Text(
                          "Create Account",
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
                      Navigator.pushNamedAndRemoveUntil(context, LoginPage.idScreen, (route) => false);
                    },
                    child: const Text(
                        "Already a member? Sign In"
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

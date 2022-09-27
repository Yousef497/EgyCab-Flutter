import 'package:flutter/material.dart';
import 'package:rider_app/UI/loginpage.dart';
import 'package:rider_app/UI/mainpage.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  static const String idScreen = "SignUp";

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
                    child: Column(
                      children: const <Widget>[
                        TextField(
                          keyboardType: TextInputType.text,
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

                        TextField(
                          keyboardType: TextInputType.emailAddress,
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

                        TextField(
                          keyboardType: TextInputType.phone,
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

                        TextField(
                          obscureText: true,
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
                          print("Logging in");
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

                  FlatButton(
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

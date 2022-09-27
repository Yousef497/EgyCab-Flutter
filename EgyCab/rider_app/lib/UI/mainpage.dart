import 'package:flutter/material.dart';
import 'package:rider_app/UI/loginpage.dart';
import 'package:rider_app/UI/signuppage.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  static const String idScreen = "MainPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 50,
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const Text(
                      "Welcome",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    Text(
                      "To EgyCab",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 18
                      ),
                    )
                  ],
                ),

                //Image
                Container(
                  height: MediaQuery.of(context).size.height/3,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Rider.png')
                    ),
                  ),
                ),

                Column(
                  children: <Widget>[
                    MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(context, LoginPage.idScreen, (route) => false);
                        },
                        color: Colors.blueGrey[200],
                        elevation: 0,
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

                    const SizedBox(
                      height: 20,
                    ),

                    Container(
                      // padding: const EdgeInsets.only(top: 3, left: 3),
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.circular(50),
                      //   border: Border(
                      //     bottom: BorderSide(color: Colors.black),
                      //     left: BorderSide(color: Colors.black),
                      //     top: BorderSide(color: Colors.black),
                      //     right: BorderSide(color: Colors.black),
                      //   ),
                      // ),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(context, SignUpPage.idScreen, (route) => false);
                        },
                        color: Colors.blueGrey[200],
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                color: Colors.black
                            ),
                            borderRadius: BorderRadius.circular(50)
                        ),

                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              //color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                  ],
                ),


              ],
            ),
          )
      )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:rider_app/UI/mainpage.dart';
import 'package:rider_app/UI/mainscreen.dart';
import 'package:rider_app/UI/loginpage.dart';
import 'package:rider_app/UI/signuppage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Brand Bold",
        primarySwatch: Colors.blue,
      ),
      //home: MainPage(),
      initialRoute: MainPage.idScreen,
      routes: {
        SignUpPage.idScreen: (context) => SignUpPage(),
        MainPage.idScreen: (context) => MainPage(),
        LoginPage.idScreen: (context) => LoginPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

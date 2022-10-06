import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:rider_app/UI/mainpage.dart';
import 'package:rider_app/UI/loginpage.dart';
import 'package:rider_app/UI/primaryscreen.dart';
import 'package:rider_app/UI/signuppage.dart';
import 'package:rider_app/Utils/utils.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

DatabaseReference userRef = FirebaseDatabase.instance.ref().child("Users");

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: Utils.messengerKey,
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
        PrimaryScreen.idScreen: (context) => PrimaryScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'package:flutter/material.dart';

class PrimaryScreen extends StatefulWidget {
  const PrimaryScreen({Key? key}) : super(key: key);

  static const String idScreen = "PrimaryScreen";

  @override
  State<PrimaryScreen> createState() => _PrimaryScreenState();
}


class _PrimaryScreenState extends State<PrimaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Center(
              child: Text("Main Screen"),
            )
        )
    );
  }
}
import 'package:flutter/material.dart';

class ProgressDialog extends StatelessWidget {

  String message;
  ProgressDialog({required this.message});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
          margin: EdgeInsets.all(15.0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height/9,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 6.0,
              ),

              CircularProgressIndicator(),

              SizedBox(
                width: 12.0,
              ),

              Text(
                message,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              )

            ],
          )

      ),
    );
  }
}

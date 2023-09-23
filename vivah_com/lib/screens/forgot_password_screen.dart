
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController email = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Forgot Password',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 100),
            child: Center(child: Text('Enter Email ID', style: TextStyle(
                fontSize: 25, letterSpacing: 0.1, color: Colors.black),)),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 5),
            child: Center(child: Text('We will send you a link to reset',
              style: TextStyle(fontSize: 14, color: Colors.black54),)),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 5),
            child: Center(child: Text('your password',
              style: TextStyle(fontSize: 14, color: Colors.black54),)),
          ),
          Padding(
            padding: EdgeInsets.only(left: 32, right: 32, top: 80),
            child: TextField(
              controller: email,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email ID',
                hintText: 'Email ID',
                alignLabelWithHint: true,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 50),
              child: SizedBox(
                width: 150,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    auth.sendPasswordResetEmail(email: email.text.toString())
                        .then((value) {
                      Utils().toastMessage(
                          "we have sent you email to reset your password");
                    }).onError((error, stackTrace) {
                      Utils().toastMessage(error.toString());
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.pink,
                    elevation: 4,
                    primary: Colors.pink,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: const Text('Send ',
                      style: TextStyle(fontSize: 15, color: Colors.white)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class Utils {
  void toastMessage(String message) {
    Fluttertoast.showToast(
      msg: "we have sent you email to reset your password",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.pink,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}



import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pinput/pinput.dart';
import 'package:vivah_com/phone_auth/phone_screen.dart';
import '../screens/bottom_navigation_screen.dart';


class Otp_Page extends StatefulWidget {
  final PhoneNumberPage;
  const Otp_Page({Key? key, this.PhoneNumberPage}) : super(key: key);

  @override
  State<Otp_Page> createState() => _Otp_PageState();
}

class _Otp_PageState extends State<Otp_Page> {

  TextEditingController pinController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  int secondsRemaining = 60;
  bool enableResend = false;
  late Timer timer;

  int? number;

  @override
  void initState() {
    super.initState();
    //getData function there

    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              PhoneNumberPage();
              // Navigator.push(context, MaterialPageRoute(builder: (context) => PhoneNumberPage(),));
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: const Text(
          'OTP',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pink,
        elevation: 1,
      ),
      backgroundColor: Colors.white,
      body: ListView(

        children: [
          const SizedBox(height: 130,),
          Center(
            child: SizedBox(
                width: 135,
                height: 135,
                child: Image.asset('assets/images/img.png')),
          ),
          const SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.only(left: 30,right: 30),
            child: Center(
              child: Pinput(
                keyboardType: TextInputType.number,
                controller: pinController,
                length: 6,
                showCursor: true,
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                textInputAction: TextInputAction.next,
              ),
            ),
          ),
          const SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.only(left:28, right: 28),
            child: SizedBox(
              height: 50,
              width: 290,
              child: ElevatedButton(
                  onPressed: () async {
                    try {
                      PhoneAuthCredential credential =
                      PhoneAuthProvider.credential(
                          verificationId: PhoneNumberPage.verify,
                          smsCode: pinController.text);
                      await auth.signInWithCredential(credential);
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(
                          builder: (context) => BottomNavigationScreen(),));
                      Fluttertoast.showToast(msg: "Login successful");
                    } catch (e) {
                      Fluttertoast.showToast(msg: "Enter Valid OTP");
                    }

                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: const Text('Veryfication OTP')),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () async {
                    try {
                      await FirebaseAuth.instance.verifyPhoneNumber(
                        phoneNumber: '+91${widget.PhoneNumberPage}',
                        verificationCompleted:
                            (PhoneAuthCredential credential) {},
                        verificationFailed: (FirebaseAuthException e) {},
                        codeSent:
                            (String verificationId, int? resendToken) {
                          PhoneNumberPage.verify = verificationId;
                          Fluttertoast.showToast(msg: "Sent OTP");
                        },
                        codeAutoRetrievalTimeout:
                            (String verificationId) {},
                      );
                      resendCode();
                    } catch (e) {
                      Fluttertoast.showToast(msg: " Failed ");
                    }
                  },
                  child: const Text("Resend OTP",style: TextStyle(color: Colors.pink),)),
              Text(" $secondsRemaining "),
            ],
          ),



        ],
      ),
    );
  }

  void resendCode() {
    //again resend count time code here
    setState(() {
      secondsRemaining = 60;
      enableResend = true;
    });
  }

  @override
  dispose() {
    timer.cancel();
    super.dispose();
  }
}


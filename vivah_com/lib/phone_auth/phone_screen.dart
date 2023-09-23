
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../screens/signup_screen.dart';
import 'otp_screen.dart';


class PhoneNumberPage extends StatefulWidget {
  const PhoneNumberPage({Key? key}) : super(key: key);
  static String verify = "";
  @override
  State<PhoneNumberPage> createState() => _PhoneNumberPageState();
}

class _PhoneNumberPageState extends State<PhoneNumberPage> {
  @override
  TextEditingController phoneController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: const Text(
          'Phone Number',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pink,
        elevation: 1,
      ),
      backgroundColor: Colors.white,
      body: ListView(

        children: [
          const SizedBox(
            height: 130,
          ),
          Center(
            child: SizedBox(
                width: 135,
                height: 135,
                child: Image.asset('assets/images/img.png')),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 30,right: 30,top: 120),
            child: IntlPhoneField(
              controller: phoneController,
              flagsButtonPadding: const EdgeInsets.all(8),
              dropdownIconPosition: IconPosition.trailing,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(
                  borderSide: BorderSide( color: Colors.black38),
                ),
              ),
              initialCountryCode: 'IN',

              onChanged: (phone) {
              },
            ),
          ),
          const SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.only(left:28, right: 28),
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                  onPressed: () async {
                    try {
                      await FirebaseAuth.instance.verifyPhoneNumber(
                        phoneNumber: '+91${phoneController.text}',
                        verificationCompleted:
                            (PhoneAuthCredential credential) {},
                        verificationFailed: (FirebaseAuthException e) {},
                        codeSent: (String verificationId, int? resendToken) {
                          PhoneNumberPage.verify = verificationId;
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Otp_Page(),
                              ));
                          Fluttertoast.showToast(msg: "Sent OTP");
                        },
                        codeAutoRetrievalTimeout: (String verificationId) {},
                      );
                    } catch (e) {
                      Fluttertoast.showToast(msg: "OTP Failed");
                    }
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => Otp_Page() ,));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: const Text('Send OTP')),
            ),
          )
        ],
      ),
    );
  }
}





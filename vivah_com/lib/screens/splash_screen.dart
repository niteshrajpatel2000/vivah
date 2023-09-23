import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vivah_com/screens/bottom_navigation_screen.dart';
import 'login_screen.dart';
import 'signup_screen.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 6),
            () {
          _isUserLogin().then((value){
            if(value){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavigationScreen(),));
            }
            else{
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
            }
          });
        }
    );
  }


  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Center(child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Image.asset('assets/images/img_1.png',width: 100,),
          )
          ),

          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation(Colors.pink),
              strokeWidth: 5,
            ),
          ),
          SizedBox(
            height: 15,
          ),

        ],
      ),

    );
  }
}


Future<bool> _isUserLogin() async {
  var loginStatus = FirebaseAuth.instance.currentUser?.uid;
  if (loginStatus != null) {
    return true;
  } else {
    return false;
  }
}

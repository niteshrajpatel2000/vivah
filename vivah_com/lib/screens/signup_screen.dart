import 'dart:async';
import 'package:flutter/material.dart';
import '../authentication/google_auth.dart';
import '../phone_auth/phone_screen.dart';
import 'bottom_navigation_screen.dart';
import 'email_login_Screen.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  Email_splash() {
    Timer(
      const Duration (seconds:2),
          () => Navigator.push(context, MaterialPageRoute(builder: (context) =>  const Email_LoginScreen(),)),);
  }
  Phone_splash() {
    Timer(
      const Duration (seconds:2),
          () => Navigator.push(context, MaterialPageRoute(builder: (context) =>  const PhoneNumberPage(),)),);
  }



  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: ListView( children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Image.asset(
              "assets/images/img_6.png",
              width: 200,
              height: 80,
            ),
          ),
        ),
        Center(
          child: const Padding(
            padding: EdgeInsets.only(top: 280),
            child: Text(
              'New to Vivah',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  letterSpacing: .3,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: GestureDetector(
            onTap: (){
              Email_splash();
              showModalBottomSheet(
                context: context,
                barrierColor: Colors.white,
                backgroundColor: Colors.pink,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                builder: (BuildContext context) {
                  return SizedBox(
                    height: 200,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:const <Widget>[
                          Center(child: CircularProgressIndicator(color: Colors.white,strokeWidth: 2,)),
                          SizedBox(height: 10,),
                          Center(child: Text( "Let's add your details while ",style: TextStyle(color: Colors.white,fontSize: 15),)),
                          Center(child: Text( " we find Matches for you",style: TextStyle(color: Colors.white,fontSize: 15),)),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: SizedBox(
              height: 55,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                color: Colors.white,
                shadowColor: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Image(
                          image: NetworkImage(
                            'https://cdn-icons-png.flaticon.com/128/2099/2099199.png',
                          ),
                          width: 20),
                    ),
                    const SizedBox(width: 50),
                    Text(
                      'Sign Up with Email',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          letterSpacing: 1),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: GestureDetector(
            onTap: (){
              Phone_splash();
              showModalBottomSheet(
                context: context,
                barrierColor: Colors.white,
                backgroundColor: Colors.pink,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                builder: (BuildContext context) {
                  return SizedBox(
                    height: 200,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:const <Widget>[
                          Center(child: CircularProgressIndicator(color: Colors.white,strokeWidth: 2,)),
                          SizedBox(height: 10,),
                          Center(child: Text( "Let's add your details while ",style: TextStyle(color: Colors.white,fontSize: 15),)),
                          Center(child: Text( " we find Matches for you",style: TextStyle(color: Colors.white,fontSize: 15),)),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: SizedBox(
              height: 55,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                color: Colors.white,
                shadowColor: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Image(
                          image: NetworkImage(
                            'https://cdn-icons-png.flaticon.com/128/15/15874.png',
                          ),
                          width: 20),
                    ),
                    const SizedBox(width: 50),
                    Text(
                      'Sign Up with Phone',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          letterSpacing: 1),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding:  EdgeInsets.only(left: 20, right: 20),
          child: GestureDetector(
              onTap: (){
                signInWithGoogle().then((value) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BottomNavigationScreen(),
                      ));
                });
              },
            child: SizedBox(
              height: 55,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                color: Colors.white,
                shadowColor: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Image(
                          image: NetworkImage(
                            'https://cdn-icons-png.flaticon.com/128/2702/2702602.png',
                          ),
                          width: 20),
                    ),
                    const SizedBox(width: 50),
                    Text(
                      'Sign Up with Google',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          letterSpacing: 1),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Already have an account?',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 5,
            ),
            Container(
              width: 100,
              height: 45,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.white),
                borderRadius: const BorderRadius.all(Radius.circular(30)),
              ),
              child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  LoginScreen(),));
                  },
                  child: const Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
            )
          ],
        )
      ]),
    );
  }
  }

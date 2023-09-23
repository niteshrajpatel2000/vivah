import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'bottom_navigation_screen.dart';
import 'forgot_password_screen.dart';
import 'homepage_screen.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  userLogin() async {
    var mAuth = FirebaseAuth.instance;
    try {
      await mAuth.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      Fluttertoast.showToast(msg: "Login Successful", textColor: Colors.blue);

      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const BottomNavigationScreen()));
    } catch (e) {
      Fluttertoast.showToast(msg: "Invalid email and password");
    }
  }

  bool passwordVisible = false;
  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:ListView(
        children: [
          Container(child:  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 90),
                child: Center(
                  child: Text(
                    'Welcome back',
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 5),
                child: Center(
                  child: Text(
                    'Login to your account',
                    style: TextStyle(color: Colors.black54, fontSize: 16),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35, right: 35, top: 30),
                child: GestureDetector(
                  onTap: () {
                    signInWithGoogle();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePageScreen(),
                        ));

                  },
                  child: SizedBox(
                    height: 59,
                    child: Card(
                      elevation: 3,
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

                          SizedBox(width: 20,),
                          Text(
                            'Continue with Google',
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                letterSpacing: 0.1),
                          ),
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
                children: const [
                  Expanded(
                    child: Divider(
                      indent: 0.0,
                      endIndent: 10.0,
                      thickness: 1,
                    ),
                  ),
                  Text(
                    "OR",
                    style: TextStyle(color: Colors.black54),
                  ),
                  Expanded(
                    child: Divider(
                      indent: 10.0,
                      endIndent: 0.0,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
               Padding(
                padding: EdgeInsets.only(left: 32, right: 32, top: 35),
                child: TextField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email ID',
                    hintText: '',
                    alignLabelWithHint: true,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 32, right: 32, top: 30),
                child: TextField(
                  controller: password,
                  obscureText: passwordVisible,
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    hintText: "",
                    labelText: "Password",
                    suffixIcon: IconButton(
                      icon: Icon(passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                    ),
                    alignLabelWithHint: true,
                    filled: false,
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 130,),
                    TextButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (
                          context) => const ForgotPasswordScreen(),));
                    },
                        child: const Text('Forgot Password?', style: TextStyle(
                            color: Colors.pink,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28),
                child: Center(
                  child: SizedBox(
                    width: 205,
                    height: 52,
                    child: FloatingActionButton.extended(
                      label: const Text('Login', style: TextStyle(fontSize: 17,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0,),), // <-- Text
                      backgroundColor: Colors.pink,
                      onPressed: () {
                        userLogin();
                      },
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 100),
                child: Expanded(
                  child: Divider(
                    thickness: 1,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: () {},
                        child: const Text("Don't have an account?",
                          style: TextStyle(
                              color: Colors.black26, fontSize: 13),)),
                    TextButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (
                          context) => const SignUpScreen(),));
                    },
                        child: const Text("Sign Up Free >", style: TextStyle(
                            color: Colors.pink,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),))
                  ],
                ),
              ),
            ],
          ),)
        ],
      ) ,
    );
  }

  signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      FirebaseAuth.instance.signInWithCredential(credential);

    }
    catch (e) {
      Fluttertoast.showToast(
        msg: "Successfully",
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.pink,
        textColor: Colors.white,
        fontSize: 10.0,
      );
    }
  }
}
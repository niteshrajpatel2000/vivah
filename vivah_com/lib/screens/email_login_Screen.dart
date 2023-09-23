import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vivah_com/screens/signup_screen.dart';
import 'bottom_navigation_screen.dart';


class Email_LoginScreen extends StatefulWidget {
  const Email_LoginScreen({Key? key}) : super(key: key);

  @override
  State<Email_LoginScreen> createState() => _Email_LoginScreenState();
}

class _Email_LoginScreenState extends State<Email_LoginScreen> {
 var   name=[
   "Ram",
   "B",
   "C",
   "D",

 ];


  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();



  validate() {
    if (nameController.text.length <= 3) {
      Fluttertoast.showToast(msg: "Invalid Name");
    } else if (!emailController.text.contains("@gmail.com")) {
      Fluttertoast.showToast(msg: "Invalid Email");
    } else if (passwordController.text.length<=8 ) {
      Fluttertoast.showToast(msg: "Enter min 5 characters");
    }  else if (addressController.text.length <= 10) {
      Fluttertoast.showToast(msg: "Enter min 5 characters");
    } else {
      emailAuth();
    }
  }

  emailAuth() {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text)
        .then((value) {
      userData();
      Fluttertoast.showToast(msg: 'summit successfully',);
    });
  }

  userData() {
    var auth = FirebaseAuth.instance.currentUser?.uid;
    FirebaseFirestore.instance.collection("users").doc(auth).set(
        {
          "name": nameController.text,
          "email": emailController.text,
          "password": passwordController.text,
          "address": addressController.text,
        }
    ).then((value)  {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomNavigationScreen(),
          ));
    });
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.pink,
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignUpScreen(),
                  ));
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              weight: 15,
            )),
      ),
      backgroundColor: Colors.pink,
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 100),
            child: Center(
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                )),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20, left: 45),
            child: Text(
              'Name',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 2,
          ),


          Padding(
            padding: const EdgeInsets.only(left: 35, right: 35),
            child: SizedBox(
              height: 65,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.white,
                elevation: 15,
                child: TextField(
                  controller: nameController,
                  cursorColor: Colors.pink,
                  style: const TextStyle(color: Colors.pink),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.person,
                      color: CupertinoColors.systemPink,
                    ),
                    hintText: "Enter your Name",
                    hintStyle: const TextStyle(color: Colors.pink),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 18),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1, //<-- SEE HERE
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(top: 10, left: 45),
            child: Text(
              'Email',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(name[0]),

          Padding(
            padding: const EdgeInsets.only(left: 35, right: 35),
            child: SizedBox(
              height: 65,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.white,
                shadowColor: Colors.pink,
                elevation: 15,
                child: TextField(
                  controller: emailController,
                  cursorColor: Colors.pink,
                  style: const TextStyle(color: Colors.pink),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.email,
                      color: CupertinoColors.systemPink,
                    ),
                    hintText: "Enter your Email",
                    hintStyle: const TextStyle(color: Colors.pink),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 18),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1, //<-- SEE HERE
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10, left: 45),
            child: Text(
              'Password',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Padding(
            padding: EdgeInsets.only(left: 35, right: 35),
            child: SizedBox(
              height: 65,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.white,
                shadowColor: Colors.pink,
                elevation: 15,
                child: TextField(
                  controller: passwordController,
                  cursorColor: Colors.pink,
                  obscureText: passwordVisible,
                  style: const TextStyle(color: Colors.pink),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: CupertinoColors.systemPink,
                    ),
                    hintText: "Enter your Password",
                    suffixIcon: IconButton(
                      icon: Icon(passwordVisible ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          passwordVisible = !passwordVisible;
                        }
                        );
                      },
                    ),
                    alignLabelWithHint: true,
                    filled: false,
                    hintStyle: const TextStyle(color: Colors.pink),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 18),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1, //<-- SEE HERE
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                ),
              ),
            ),
          ),
          // SizedBox(height: 16),
          // _isPasswordValid ? Text('Password follows the policy!', style: TextStyle(color: Colors.green),) : Text(
          //   'Password should required at least 8 characters and contains at least one uppercase letter, one lowercase letter, one digit, and one special character',
          //   style: TextStyle(color: Colors.white),
          // ),
          const Padding(
            padding: EdgeInsets.only(top: 10, left: 45),
            child: Text(
              'Address*',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35, right: 35),
            child: SizedBox(
              height: 65,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.white,
                elevation: 15,
                child: TextField(
                  controller: addressController,
                  cursorColor: Colors.pink,
                  style: const TextStyle(color: Colors.pink),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.home,
                      color: CupertinoColors.systemPink,
                    ),
                    hintText: "Enter your Address",
                    hintStyle: const TextStyle(color: Colors.pink),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 18),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 10,
                  padding:
                  EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                  primary: Colors.white,
                  shape: StadiumBorder(),
                ),
                onPressed: () {
                  validate();
                },
                child: Text(
                  'Summit',
                  style: TextStyle(color: Colors.pink),
                )),
          ),


        ],
      ),
    );
  }


}
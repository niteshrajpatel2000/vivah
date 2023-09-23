
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'qualification_screen.dart';
import 'religion_screen.dart';

class Email_MoblileScreen extends StatefulWidget {
  const Email_MoblileScreen({Key? key}) : super(key: key);

  @override
  State<Email_MoblileScreen> createState() => _Email_MoblileScreenState();
}

class _Email_MoblileScreenState extends State<Email_MoblileScreen> {
  @override

  FocusNode focusNode = FocusNode();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ReligionScreen(),
                  ));
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black26,
              weight: 15,
            )),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          Center(
            child: SizedBox.fromSize(
              size: const Size(120, 120),
              child: ClipOval(
                child: Material(
                  color: Colors.pink,
                  child: InkWell(
                    splashColor: Colors.white,
                    onTap: () {},
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Icon(
                            Icons.attach_email,
                            weight: 70,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 20, left: 40, right: 40),
              child: Text(
                '   An active email ID & phone no. \n are required to secure your profile',
                style: TextStyle(color: Colors.black54, fontSize: 18),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 25, left: 30),
            child: Text(
              'Email ID',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w400),
            ),
          ),
          const Padding(
              padding: EdgeInsets.only(top: 20, left: 30, right: 30),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email ID',
                  hintText: 'Email ID',
                ),
              )),
          const Padding(
            padding: EdgeInsets.only(top: 40, left: 30),
            child: Text(
              'Mobile no.',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w400),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20,left: 30,right: 30),
            child: IntlPhoneField(
              focusNode: focusNode,
              decoration: const InputDecoration(
                labelText: 'Mobile no',
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
              languageCode: "in",
              onChanged: (phone) {},
              onCountryChanged: (country) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Center(
              child: SizedBox(
                width: 205,
                height: 50,
                child: FloatingActionButton.extended(
                  label: const Text('Continue',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,letterSpacing: 0,),),
                  backgroundColor: Colors.pink,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const QulalificationScreen(),));
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

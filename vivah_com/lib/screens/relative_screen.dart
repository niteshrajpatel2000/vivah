import 'package:flutter/material.dart';

import 'name_dob_screen.dart';
import 'signup_screen.dart';

class RelativeScreen extends StatefulWidget {
  const RelativeScreen({Key? key}) : super(key: key);

  @override
  State<RelativeScreen> createState() => _RelativeScreenState();
}

class _RelativeScreenState extends State<RelativeScreen> {
  bool checkBoxValue1 = false;
  bool checkBoxValue2 = false;
  bool checkBoxValue3 = false;
  bool checkBoxValue4 = false;
  bool checkBoxValue5 = false;
  bool checkBoxValue6 =false;
  bool checkBoxValue7 =false;

  @override
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
                    builder: (context) => const SignUpScreen(),
                  ));
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black26,
              weight: 15,
            )),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 40,
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
                            Icons.person,
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
          const Padding(
            padding: EdgeInsets.only(top: 20, left: 12),
            child: Text(
              'This Profile is for',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: Row(
                  children: [
                    Container(
                        width: 130,
                        height: 55,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black26),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30)),
                        ),
                        child: Row(
                          children: [
                            Checkbox(
                              shape: const CircleBorder(),
                              value: checkBoxValue1,
                              onChanged: (bool? newValue) {
                                setState(() {
                                  checkBoxValue1 = newValue!;
                                });
                              },
                            ),
                            const Text('Myself',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: Row(
                  children: [
                    Container(
                        width: 130,
                        height: 55,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black26),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30)),
                        ),
                        child: Row(
                          children: [
                            Checkbox(
                              shape: const CircleBorder(),
                              value: checkBoxValue2,
                              onChanged: (bool? newValue) {
                                setState(() {
                                  checkBoxValue2 = newValue!;
                                });
                              },
                            ),
                            const Text('My Son',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ))
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: Row(
                  children: [
                    Container(
                        width: 160,
                        height: 55,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black26),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30)),
                        ),
                        child: Row(
                          children: [
                            Checkbox(
                              shape: const CircleBorder(),
                              value: checkBoxValue3,
                              onChanged: (bool? newValue) {
                                setState(() {
                                  checkBoxValue3 = newValue!;
                                });
                              },
                            ),
                            const Text('My Daughter',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: Row(
                  children: [
                    Container(
                        width: 155,
                        height: 55,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black26),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30)),
                        ),
                        child: Row(
                          children: [
                            Checkbox(
                              shape: const CircleBorder(),
                              value: checkBoxValue4,
                              onChanged: (bool? newValue) {
                                setState(() {
                                  checkBoxValue4 = newValue!;
                                });
                              },
                            ),
                            const Text('My Brother',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ))
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: Row(
                  children: [
                    Container(
                        width: 150,
                        height: 55,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black26),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30)),
                        ),
                        child: Row(
                          children: [
                            Checkbox(
                              shape: const CircleBorder(),
                              value: checkBoxValue5,
                              onChanged: (bool? newValue) {
                                setState(() {
                                  checkBoxValue5 = newValue!;
                                });
                              },
                            ),
                            const Text('My Sister',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: Row(
                  children: [
                    Container(
                        width: 150,
                        height: 55,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black26),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30)),
                        ),
                        child: Row(
                          children: [
                            Checkbox(
                              shape: const CircleBorder(),
                              value: checkBoxValue6,
                              onChanged: (bool? newValue) {
                                setState(() {
                                  checkBoxValue6 = newValue!;
                                });
                              },
                            ),
                            const Text('My Friend',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ))
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: Row(
                  children: [
                    Container(
                        width: 150,
                        height: 55,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black26),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30)),
                        ),
                        child: Row(
                          children: [
                            Checkbox(
                              shape: const CircleBorder(),
                              value: checkBoxValue7,
                              onChanged: (bool? newValue) {
                                setState(() {
                                  checkBoxValue7 = newValue!;
                                });
                              },
                            ),
                            const Text('My Relative',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ))
                  ],
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Center(
              child: SizedBox(
                width: 205,
                height: 52,
                child: FloatingActionButton.extended(
                  label: const Text('Continue',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,letterSpacing: 0,),), 
                  backgroundColor: Colors.pink,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const NameDobScreen(),));
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

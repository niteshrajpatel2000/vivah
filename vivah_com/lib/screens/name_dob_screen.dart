import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'relative_screen.dart';
import 'religion_screen.dart';

class NameDobScreen extends StatefulWidget {
  const NameDobScreen({Key? key}) : super(key: key);

  @override
  State<NameDobScreen> createState() => _NameDobScreenState();
}

class _NameDobScreenState extends State<NameDobScreen> {
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
                    builder: (context) => const RelativeScreen(),
                  ));
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black26,
              weight: 15,
            )),
      ),
      body:ListView(
        children: [
          Column(
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
                                Icons.perm_identity,
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
                padding: EdgeInsets.only(top: 20, right: 170),
                child: Text(
                  'Your name',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 25,right: 25,left: 32),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border:OutlineInputBorder() ,
                      labelText: 'First name',
                      hintText: 'First name',
                    ),
                  ),
                ),
              ),

              const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 25,right: 25,left: 32),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border:OutlineInputBorder() ,
                      labelText: 'Last name',
                      hintText: 'Last name',
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30, right: 155),
                child: Text(
                  'Date of birth',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 25,right: 70),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 60,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Day',
                          hintText: 'DD',
                        ),
                      ),
                    ),
                    SizedBox(width: 16), // Add spacing between the text fields
                    SizedBox(
                      width: 60,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Month',
                          hintText: 'MM',
                        ),
                      ),
                    ),
                    SizedBox(width: 16), // Add spacing between the text fields
                    SizedBox(
                      width: 100,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Year',
                          hintText: 'YYYY',
                        ),
                      ),
                    ),
                  ],
                ),
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ReligionScreen(),));
                      },
                    ),
                  ),
                ),
              ),

            ],
          ),
        ],
      )
    );
  }
}

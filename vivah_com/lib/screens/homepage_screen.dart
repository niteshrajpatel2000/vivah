
import 'package:flutter/material.dart';
import 'package:profile_photo/profile_photo.dart';

import '../drawer screen/drawer_screen.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:AppDrawer() ,
      appBar: AppBar(
        backgroundColor: Colors.pink,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(0),
            child: Card(
              margin: const EdgeInsets.all(0),
              elevation: 3,
              color: Colors.black38,
              child: SizedBox(
                // width: 300,
                height: 250,
                 // child: Padding(
                 //   padding: const EdgeInsets.only(top: 00,left: 30),
                 //   child: Row(
                 //      children: [
                 //        ProfilePhoto(
                 //          totalWidth: 100.5,
                 //          cornerRadius: 100.5,
                 //          color: Colors.blue,
                 //          outlineColor: Colors.pink,
                 //          outlineWidth: 2,
                 //          textPadding: 10,
                 //          showName: true,
                 //          fontColor: Colors.white,
                 //          nameDisplayOption: NameDisplayOptions.initials,
                 //          fontWeight: FontWeight.w500,
                 //          image: const AssetImage('assets/images/img_4.png'),
                 //          badgeAlignment: Alignment.bottomCenter,
                 //          onTap: () {
                 //            // open profile for example
                 //          },
                 //          onLongPress: () {
                 //            // popup to message user for example
                 //          },
                 //        ),
                 //        const SizedBox(
                 //          height: 10,
                 //        ), //SizedBox
                 //        Padding(
                 //          padding: const EdgeInsets.only(left: 20    ),
                 //          child: SizedBox(
                 //            width: 150,
                 //            child: ElevatedButton(
                 //              onPressed: () {},
                 //              style: ButtonStyle(
                 //                  backgroundColor:
                 //                      MaterialStateProperty.all(Colors.pink)),
                 //              child: Padding(
                 //                padding: const EdgeInsets.all(4),
                 //                child: Row(
                 //                  children: const [
                 //                    Icon(
                 //                      Icons.workspace_premium,
                 //                    ),
                 //                    Text('Upgrade Now')
                 //                  ],
                 //                ),
                 //              ),
                 //            ),
                 //          ),
                 //        ) //SizedBox
                 //      ],
                 //    ),
                 // ), //Column

              ), //SizedBox
            ),
          ),
        ],
      ),
    );
  }
}

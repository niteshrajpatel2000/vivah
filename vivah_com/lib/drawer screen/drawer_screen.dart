
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:profile_photo/profile_photo.dart';
import '../location/current_location.dart';
import '../model/firebasefile.dart';
import '../model/usermodel.dart';
import '../profilepages/editprofile.dart';
import '../screens/login_screen.dart';




class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {

  UserDataModel? usersModel;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  void initState() {
    super.initState();

    FirebaseUser().retriveData().then((value) {
      setState(() {
        usersModel = value as UserDataModel ;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Container(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.pink,
              ),

              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 170),
                    child: ProfilePhoto(
                      totalWidth: 100.5,
                      cornerRadius: 100.5,
                      color: Colors.blue,
                      outlineColor: Colors.white,
                      outlineWidth: 2,
                      textPadding: 10,
                      showName: true,
                      fontColor: Colors.white,
                      nameDisplayOption: NameDisplayOptions.initials,
                      fontWeight: FontWeight.w500,
                      image: NetworkImage(
                        "${usersModel?.imageUrl}"),
                      badgeAlignment: Alignment.bottomCenter,
                      onTap: () {
                        // open profile for example
                      },
                      onLongPress: () {
                        // popup to message user for example
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text("${usersModel?.name}", style: TextStyle(color: Colors.white),),
                  ),
                  Text("${usersModel?.email}", style: TextStyle(color: Colors.white),),
                ],
              ),
            ),


            ListTile(
              leading: Icon(Icons.person,color: Colors.pink,),
              title: const Text('Edit Profile',style: TextStyle(color: Colors.pink),),
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EditProfilePage(),));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings,color: Colors.pink,),
              title: const Text('setting',style: TextStyle(color: Colors.pink)),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            Divider(),
            ListTile(
              leading: Icon(Icons.location_on,color: Colors.pink,),
              title: const Text('Location',style: TextStyle(color: Colors.pink)),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MapCurrent(),));
              },
            ),

            Divider(),

            ListTile(
              leading: Icon(Icons.logout, color: Colors.pink,),
              title: const Text('Log Out',style: TextStyle(color: Colors.pink)),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) =>  AlertDialog(
                    title: Column(
                      children:  [
                        Icon(Icons.logout, color: Colors.pink,),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text("Are you sure you want to logout?",style: TextStyle(color: Colors.pink)),
                        ),
                        // Text('Are you sure you want to logout?',style: TextStyle(color: Colors.pink))
                      ],
                    ),

                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'No', style: TextStyle(color: Colors.pink),),
                      ),
                      TextButton(onPressed: () {
                        FirebaseAuth.instance.signOut().then((value) {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                        }
                        );
                      },
                        child: const Text(
                          'Yes', style: TextStyle(color: Colors.pink),),)
                    ],
                  ),
    );
              },
            ),

          ],
        ),
      ),)
    );
  }
}

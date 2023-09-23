
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../drawer screen/drawer_screen.dart';
import '../model/usermodel.dart';
import '../screens/bottom_navigation_screen.dart';



class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  UserDataModel? usersModel;

  PickedFile? imageFile;
  final picker = ImagePicker();

  String? imageUrl;

  @override
  void initState() {
    super.initState();
    retriveData().then((value) {
      setState(() {
        usersModel = value;
        nameController.text = usersModel?.name?? "";
        emailController.text = usersModel?.email ?? "";
        addressController.text = usersModel?.address ?? "";
      });
    });
  }

  Future<UserDataModel?> retriveData() async {
    var auth = FirebaseAuth.instance.currentUser?.uid;
    var user = await FirebaseFirestore.instance.collection("users").doc(auth).get();
    var userModel = UserDataModel.fromJson(user.data()!);
    return userModel;
  }

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);
    setState(() {
      imageFile = pickedFile;
    });
  }

  Future<void> uploadImageToFirebase() async {
    final auth = FirebaseAuth.instance.currentUser?.uid;
    if (imageFile != null) {
      File file = File(imageFile!.path);
      var ref =
      FirebaseStorage.instance.ref().child('usersImage').child('$auth.jpg');
      UploadTask uploadTask = ref.putFile(file);
      TaskSnapshot snapshot = await uploadTask;
      imageUrl = await snapshot.ref.getDownloadURL();
    }
  }
  void updateUser() async {
    var auth = FirebaseAuth.instance.currentUser?.uid;
    await  uploadImageToFirebase();
    FirebaseFirestore.instance.collection("users").doc(auth).update({
      "name": nameController.text.trim(),
      "email": emailController.text.trim(),
      "address": addressController.text.trim(),
      "imageUrl":imageUrl
    }).then((value){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavigationScreen(),));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AppDrawer(),));
        }, icon: Icon(CupertinoIcons.arrow_left)),
        title: const Text('EditProfilePage'),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  imageFile != null ?
                  CircleAvatar(
                      radius: 50,
                      backgroundImage: FileImage(File(imageFile!.path))

                  ): CircleAvatar(
                    radius: 50,
                    backgroundImage: imageUrl != ""? NetworkImage("${usersModel?.imageUrl}"): const NetworkImage("https://firebasestorage.googleapis.com/v0/b/flutterbasic-a5dcc.appspot.com/o/usersImage%2Fpic.webp?alt=media&token=6141432e-12ce-4633-a270-dfcecc902371"),),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.edit,color: Colors.pink),
                        onPressed: () {
                          showModalBottomSheet(
                            backgroundColor: Colors.white,
                            context: context,
                            builder: (BuildContext context) {
                              return Wrap(
                                children: [
                                  ListTile(
                                    leading: const Icon(
                                      Icons.camera_alt,
                                      color: Colors.pink,
                                    ),
                                    title: const Text('Camera'),
                                    onTap: () {
                                      pickImage(ImageSource.camera);
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    leading: const Icon(
                                      Icons.image,
                                      color: Colors.pink,
                                    ),
                                    title: const Text('Gallery'),
                                    onTap: () {
                                      pickImage(ImageSource.gallery);
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
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
                    hintText: "${usersModel?.name}",
                      // hintText: "name",
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
                  controller: emailController,
                  cursorColor: Colors.pink,
                  style: const TextStyle(color: Colors.pink),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.email,
                      color: CupertinoColors.systemPink,
                    ),
                    hintText: "${usersModel?.email}",
                    // hintText: "email",
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
                child: Container(
                  child: TextField(
                    controller: addressController,
                    cursorColor: Colors.white,
                    style: const TextStyle(color: Colors.pink),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.home,
                        color: CupertinoColors.systemPink,
                      ),
                      hintText: "${usersModel?.address}",
                      // hintText: "address",
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
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 10,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 20.0),
                  primary: Colors.white,
                  shape: const StadiumBorder(),
                ),
                onPressed: () {
                  updateUser();
                },
                child: const Text(
                  'Update',
                  style: TextStyle(color: Colors.pink),
                )),
          ),
        ],
      ),
    );
  }
  // Future<void> pickImage(ImageSource source) async {
  //   final picker = ImagePicker();
  //   final pickedFile = await picker.getImage(source: source);
  //
  //   if (pickedFile != null) {
  //
  //   } else {
  //     print('No image picked.');
  //   }
  // }
}
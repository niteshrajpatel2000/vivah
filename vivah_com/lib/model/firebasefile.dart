
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vivah_com/model/usermodel.dart';

class FirebaseUser{
  Future<UserDataModel?> retriveData() async {
    var auth = FirebaseAuth.instance.currentUser?.uid;
    var user = await FirebaseFirestore.instance.collection("users").doc(auth).get();
    var usersModal = UserDataModel.fromJson(user.data()!);
    return usersModal;
  }
}
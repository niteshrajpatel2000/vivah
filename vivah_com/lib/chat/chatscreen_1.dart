import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vivah_com/chat/chatclass.dart';

import '../screens/bottom_navigation_screen.dart';
import 'chatscreen_2.dart';

class ChatScreen_1 extends StatefulWidget {
  const ChatScreen_1({Key? key}) : super(key: key);

  @override
  State<ChatScreen_1> createState() => _ChatScreen_1State();
}

class _ChatScreen_1State extends State<ChatScreen_1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Chat'),
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomNavigationScreen(),
                  ));
            },
            icon: Icon(Icons.arrow_back)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
        elevation: 1,
        backgroundColor: Colors.pink,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.chat),
      ),
      body: StreamBuilder(
        stream: apis.firestore.collection('users1').snapshots(),
        builder: (context, snapshot) {

          final list=[];
          if (snapshot.hasData) {
            final data = snapshot.data?.docs;
            for (var i in data!) {
              print(i.data());
              list.add(i.data()['name']);
            }
          }
          return ListView.builder(
            itemCount: list.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              // return ChatScreen_2();
              return Text('Name:${list[index]}');
            },
          );
        },
      ),
    );
  }
}

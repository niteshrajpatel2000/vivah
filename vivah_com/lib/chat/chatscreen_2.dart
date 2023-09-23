import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen_2 extends StatefulWidget {
  const ChatScreen_2({Key? key}) : super(key: key);
  @override
  State<ChatScreen_2> createState() => _ChatScreen_2State();
}

class _ChatScreen_2State extends State<ChatScreen_2> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.pink.shade300,
      margin:EdgeInsets.symmetric(horizontal: 10,vertical:5),
      elevation: 1,
    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)) ,
      child: InkWell(
        onTap: () {},
        child: ListTile(
          leading: CircleAvatar(child: Icon(CupertinoIcons.person),),
          title: Text('Nitesh Raj Patel'),
          subtitle:Text('Helloo..',maxLines: 1,),
          trailing:Text('12:30 PM' ,style: TextStyle(color: Colors.black45),),
        ),
      ),
    );
  }
}

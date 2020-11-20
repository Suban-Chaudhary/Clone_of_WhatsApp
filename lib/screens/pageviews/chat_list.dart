import 'package:flutter/material.dart';

class ChatListScreen extends StatefulWidget {
  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.teal[500],
          onPressed: (){},
          child: Icon(Icons.message, color: Colors.white,),
        ),
        body: Center(
          child: Text("Chat List screen"),
        ),
      ),
    );
  }
}

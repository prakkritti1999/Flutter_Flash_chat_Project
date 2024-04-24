import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  static String id = 'chat_screen';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _firestore = FirebaseFirestore.instance;
  //final _auth = FirebaseAuth.instance;
  String messageText="";
  User loggedInUser =FirebaseAuth.instance.currentUser!;

  void initState(){
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async{
    if (loggedInUser != null) {
      print("user signed in");
    } else {
      // No user signed in
      print('No user signed in');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Chat"),),
        body: SafeArea(
          child: Column(children: [
            Container(
              child: Row(children: [
                Expanded(child: TextField(
                  onChanged: (value){
                    messageText = value;
                  },
                )),
                ElevatedButton(
                  onPressed: (){
                    _firestore
                    .collection("messages")
                    .add({'text':messageText,
                    'sender':loggedInUser.email});
                  }, 
                  child: Text("Send",))
              ],),
            )
          ],
        ),
      ),
    );
  }
}

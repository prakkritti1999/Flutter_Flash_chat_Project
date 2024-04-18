import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  static String id = 'chat_screen';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;

  void initState(){
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async{
    final user =await _auth.currentUser!;
    if (user != null) {
      // User is signed in
      print('User is signed in: ${user.uid}');
    } else {
      // No user signed in
      print('No user signed in');
    }
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

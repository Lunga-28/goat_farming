import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String rEmail;
  const ChatPage({super.key,
  required this.rEmail,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(rEmail)),
    );
  }
}
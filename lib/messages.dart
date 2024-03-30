import 'dart:js';

import 'package:flutter/material.dart';
import 'package:goat_farm_manager/auth/auth_services.dart';
import 'package:goat_farm_manager/components/my_drawer.dart';
import 'package:goat_farm_manager/service/chat/chat_service.dart';

class Messages extends StatelessWidget {
  Messages({super.key});

  final ChatService _chatService =ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:const Text("Messages"),
        ),
        drawer:const MyDrawer(),
        body: _builduserList(),
    );
  }
  Widget _builduserList(){
    return StreamBuilder(
      stream: _chatService.getUserStream(), 
     builder: (context, snapshot){
      if(snapshot.hasError){
        return Text("Error");
      }
     },
     );
  }
}
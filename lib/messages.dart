import 'dart:js';

import 'package:flutter/material.dart';
import 'package:goat_farm_manager/auth/auth_services.dart';
import 'package:goat_farm_manager/components/my_drawer.dart';
import 'package:goat_farm_manager/components/user_tile.dart';
import 'package:goat_farm_manager/service/chat/chat_service.dart';
import 'chat_page.dart';

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
        return const Text("Error");
      }
      //if lloading
      if(snapshot.connectionState == ConnectionState.waiting)
      {
          return const Text("loading");
      }
      return ListView(
        children: snapshot.data!.map<Widget>((userData) => _buildUserListItem(userData, context)).toList(),
      );
     },
     );
  }
  Widget _buildUserListItem(Map<String, dynamic> userData, BuildContext context){
    // display all current stuff excluding current user
    return UserTile(
      text: userData["email"], onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) =>ChatPage(
          rEmail: userData["email"],
        ),));
      },);
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:goat_farm_manager/auth/auth_services.dart';
import 'package:goat_farm_manager/components/_textfied.dart';
import 'package:goat_farm_manager/components/bubble.dart';
import 'package:goat_farm_manager/service/chat/chat_service.dart';

class ChatPage extends StatelessWidget {
  final String rEmail;
  final String rID;
  ChatPage({super.key,
  required this.rEmail,
  required this.rID});
// text controller

final TextEditingController _messageController = TextEditingController();

// auth services along with chat
final ChatService _chatService = ChatService();
final AuthService _authService = AuthService();

//method of sending message
void sendMessage()async {
  //check if text field is not blank and if not send message
  if(_messageController.text.isNotEmpty){
    await _chatService.sendMessage(rID, _messageController.text);

    //clear controller after sending
    _messageController.clear();
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(rEmail),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
        ),
      body: Column(children: [
        Expanded(child: _buildMessageList()),
        _buildUserInput(),
      ],),
    );
  }

  //_buildMessageList
  Widget _buildMessageList(){
    String SenderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: _chatService.getMessages(rID, SenderID),
      builder: (context, snapshot){
        if(snapshot.hasError){
          return const Text("Error occured");
        }
        if (snapshot.connectionState == ConnectionState.waiting){
          return const Text("Loading");
        }
        return ListView(
          children: snapshot.data!.docs.map((doc) => _buildMessageItem(doc)).toList(),
        );
      },
    );
  }

  Widget _buildMessageItem(DocumentSnapshot doc){
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    // is current user
    bool isCurrent = data['senderID'] == _authService.getCurrentUser()!.uid;
    // if sender is current align messages to right else align to the right
    var alignment = isCurrent ? Alignment.centerRight : Alignment.centerLeft;
    return Container(
      alignment: alignment,
      child: Column(
        crossAxisAlignment: isCurrent ? CrossAxisAlignment.end: CrossAxisAlignment.start,
        children: [
          ChatBubble(isCurrent: isCurrent,
          message: data["message"],)
        ],
      ),
    );
  }

  //message input
  Widget _buildUserInput(){
    return Padding(padding: const EdgeInsets.only(bottom: 50),
          child:   Row(
      children: [
        Expanded(child: Myfield(controller: _messageController,
        hintText: "Type Message",
        obscureText: false,
        ),
        ),
        //send Button
        Container(
          decoration:const BoxDecoration(color: Colors.green,
                      shape: BoxShape.circle,),     
          child: IconButton(onPressed: sendMessage, icon:const Icon(Icons.arrow_upward, color: Colors.white,)),
        )
      ],
    ),
    ) ;
  }
}
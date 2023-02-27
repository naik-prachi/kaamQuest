import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/conversation_list.dart';
import '../data/chat_user_details.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // the body section of the chatPage.dart is entirely scrollable
      body: SingleChildScrollView(
        // gives the bouncing effect when a user's scrolling reaches the end or beginning
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        CircleAvatar(
                          backgroundColor: Colors.cyan,
                          maxRadius: 25,
                        ),
                        SizedBox(width: 12),
                        Text(
                          "Chats",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            color: Colors.grey.withOpacity(0.5),
                            height: 45,
                            width: 45,
                            child: const Icon(CupertinoIcons.camera_fill),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Icon(CupertinoIcons.ellipsis_vertical),
                      ],
                    ),

                    /*Container(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 2, bottom: 2),
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.deepPurple,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.pink[50],
                            size: 20,
                          ),
                          const SizedBox(width: 2),
                          const Text(
                            "Add New",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  */
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: const TextStyle(
                      //color: Colors.grey[600],
                      ),
                  prefixIcon: const Icon(
                    CupertinoIcons.search,
                  ),
                  filled: true,
                  //fillColor: Colors.grey[100],
                  contentPadding: const EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                        //color: Colors.grey.shade600,
                        ),
                  ),
                ),
              ),
            ),
            ListView.builder(
              itemCount: Users.chatUsers.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 16),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ConversationList(
                  name: Users.chatUsers[index].name,
                  messageText: Users.chatUsers[index].messageText,
                  imageURL: Users.chatUsers[index].imageURL,
                  time: Users.chatUsers[index].time,
                  isMessageRead: (index == 0 || index == 3) ? true : false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


/*import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<types.Message> _messages = [];
  final _user = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Chat(
            messages: _messages,
            onSendPressed: _handleSendPressed,
            user: _user));
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: "id", // const Uuid().v4(),
      text: message.text,
    );

    _addMessage(textMessage);
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }
}*/

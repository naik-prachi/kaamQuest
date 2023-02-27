/*
This widget file takes the user's name, text message, image URL, time, and a 
Boolean message type value as parameters. And it returns the template 
containing the values.
*/

import 'package:flutter/material.dart';

import '../screens/chat/chat_detail_page.dart';

class ConversationList extends StatefulWidget {
  String name, messageText, imageURL, time;
  bool isMessageRead;

  ConversationList({
    super.key,
    required this.name,
    required this.messageText,
    required this.imageURL,
    required this.time,
    required this.isMessageRead,
  });

  @override
  State<ConversationList> createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const ChatDetailPage();
            },
          ),
        );
      },
      child: Container(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      widget.imageURL,
                    ),
                    maxRadius: 30,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // user name
                          Text(
                            widget.name,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),

                          const SizedBox(height: 6),

                          // message text
                          Text(
                            widget.messageText,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[600],
                              fontWeight: widget.isMessageRead
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              widget.time,
              style: TextStyle(
                fontSize: 12,
                fontWeight:
                    widget.isMessageRead ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

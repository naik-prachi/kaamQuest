import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

import '../../data/chat_details.dart';

class ChatDetailPage extends StatefulWidget {
  const ChatDetailPage({super.key});

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepPurple.withOpacity(0.8),
        flexibleSpace: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    CupertinoIcons.back,
                    //color: Colors.black,
                  ),
                ),
                const SizedBox(width: 2),
                const CircleAvatar(
                  backgroundImage: NetworkImage("assets/images/profile1.png"),
                  maxRadius: 20,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "User's Name",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "Online",
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),

                // settings icon
                GestureDetector(
                  onTap: () async {
                    Uri phoneno = Uri.parse('tel:+917769802703');
                    if (await launchUrl(phoneno)) {
                      //dialer opened
                    } else {
                      //dailer is not opened
                    }
                  },
                  child: const Icon(CupertinoIcons.phone_fill),
                ),

                const SizedBox(width: 17),

                // vertical more
                const Icon(CupertinoIcons.ellipsis_vertical),
              ],
            ),
          ),
        ),
        //title: const Text("Chat Detai"),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: User1.messages.length,
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 10, bottom: 10),
                child: Align(
                  alignment: (User1.messages[index].messageType == "receiver"
                      ? Alignment.topLeft
                      : Alignment.topRight),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: (User1.messages[index].messageType == "receiver"
                          ? Colors.grey[850]
                          : Colors.purple[900]),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      User1.messages[index].messageContent,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.grey[850],
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.purple[300],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        color: Colors.grey,
                        child: const TextField(
                          textCapitalization: TextCapitalization.sentences,
                          decoration: InputDecoration(
                            hintText: "Write a message...",
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                            //border: InputBorder.,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),

                  // send
                  FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: Colors.deepPurple,
                    elevation: 0,
                    child: const Icon(
                      Icons.send_rounded,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

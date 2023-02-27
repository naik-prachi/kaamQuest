import 'package:kaam_quest/models/chat_message_model.dart';

class User1 {
  static List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello", messageType: "receiver"),
    ChatMessage(
        messageContent: "I wanted to add a requirement",
        messageType: "receiver"),
    ChatMessage(
        messageContent: "Heyy, sure. what would that be?",
        messageType: "sender"),
    ChatMessage(
        messageContent:
            "I wanted to cut down the information but add a graph to the poster.",
        messageType: "receiver"),
    ChatMessage(messageContent: "what kind of graph?", messageType: "sender"),
    ChatMessage(messageContent: "piechart, bargraph..?", messageType: "sender"),
    ChatMessage(
        messageContent:
            "I'm not sure yet 😅 i'll get back with you regarding that. i just wanted to make sure we could do that.",
        messageType: "receiver"),
    ChatMessage(messageContent: "Alight, no worries.", messageType: "sender"),
    ChatMessage(
        messageContent:
            "Depending on your choice of graph, we'll have to move arround a few things",
        messageType: "sender"),
    ChatMessage(
        messageContent: "but it shouldn't be a problem :)",
        messageType: "sender"),
  ];
}

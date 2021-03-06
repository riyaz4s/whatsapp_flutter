import 'package:ChatApp/api_client/api.dart';
import 'package:ChatApp/models/chatModel.dart';
import 'package:ChatApp/screens/home/tabview/chatPage/chatTile.dart';
import 'package:flutter/material.dart';

class ChatList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChatListState();
  }
}

class ChatListState extends State<ChatList> {
  Future<List<ChatModel>> futureChats;

  void initState() {
    super.initState();
    futureChats = fetchChats();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ChatModel>>(
      future: futureChats,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            color: Color(0xFF101E25),
            child: ListView.builder(
              itemExtent: 80,
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [ChatTile(chat: snapshot.data[index]), Divider( indent: 80.0 )],
                );
              },
            ),
          );
        } else {
          return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [CircularProgressIndicator()]);
        }
      },
    );
  }
}

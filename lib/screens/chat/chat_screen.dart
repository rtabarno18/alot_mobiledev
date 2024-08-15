import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat')),
      body: ListView(
        children: List.generate(
            10,
            (index) => ListTile(
                  title: Text('Message $index'),
                  subtitle: Text('Message content here'),
                )),
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_time_chat/widgets/chat_message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final _chatcontroller = TextEditingController();
  final _focusNode = FocusNode();
  bool _isWritting = false;

  final List<ChatMessage> _messages = [
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            CircleAvatar(
              child: Text('MJ', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              backgroundColor: Colors.indigo,
            ),
            SizedBox(width: 16),
            Text('Miguel Jardinez')
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget> [
            Flexible(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: _messages.length,
                  itemBuilder: (_, i) => _messages[i],
                  reverse: true,
                )
            ),
            const Divider(height: 1),
            Container(
                color: Colors.white,
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.only(left: 16),
                child: Row(
                  children: [
                    Flexible(
                      child: TextField(
                        controller: _chatcontroller,
                        onSubmitted: _onSubmit,
                        onChanged: (String value) {
                          setState(() {
                            value.trim().isNotEmpty
                                ? _isWritting = true
                                : _isWritting = false;
                          });
                        },
                        decoration: const InputDecoration.collapsed(
                            hintText: 'Send Message'
                        ),
                        focusNode: _focusNode,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Platform.isIOS
                        ? CupertinoButton(
                      child: const Text('Send'),
                      onPressed: _isWritting
                          ? () => _onSubmit(_chatcontroller.text.trim())
                          : null,
                    )
                        : IconTheme(
                      data: const IconThemeData(color: Colors.blue),
                      child: IconButton(
                        icon: const Icon(Icons.send),
                        color: Colors.blue,
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onPressed: _isWritting
                            ? () => _onSubmit(_chatcontroller.text.trim())
                            : null,
                      ),
                    )
                  ],
                )
            )
          ],
        ),
      ),
    );
  }

  void _onSubmit(String value) {
    print(value);
    _focusNode.requestFocus();
    _chatcontroller.clear();

    final newMessage = ChatMessage(
      uid: '123',
      message: value,
      animationController: AnimationController(vsync: this, duration: const Duration(milliseconds: 150)),
    );
    _messages.insert(0, newMessage);
    newMessage.animationController.forward();

    setState(() {
      _isWritting = false;
    });
  }

  @override
  void dispose() {
    for(ChatMessage message in _messages) {
      message.animationController.dispose();
    }
    super.dispose();
  }

}

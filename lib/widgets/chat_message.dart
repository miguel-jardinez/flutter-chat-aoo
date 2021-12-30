import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {

  final String uid;
  final String message;
  final AnimationController animationController;

  const ChatMessage({
    Key? key,
    required this.uid,
    required this.message,
    required this.animationController
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final bool _isOwner = uid == '123';
    final double _marginLeft = _isOwner ? 50 : 16;
    final double _marginRight = !_isOwner ? 50 : 16;
    final Color _colorOwner = _isOwner ? Colors.white : Colors.black;

    return FadeTransition(
      opacity: animationController,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(parent: animationController, curve: Curves.easeOut),
        child: Align(
          alignment: _isOwner ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            margin: EdgeInsets.only(bottom: 8, left: _marginLeft, right: _marginRight),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Text(message,
                style: TextStyle(color: _colorOwner, fontSize: 14)),
            decoration: BoxDecoration(
                color: _isOwner ? Colors.blue : Colors.grey[300],
                borderRadius: BorderRadius.circular(20)
            ),
          ),
        ),
      ),
    );
  }
}


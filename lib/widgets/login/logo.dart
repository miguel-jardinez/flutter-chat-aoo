import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
    required this.headetText
  }) : super(key: key);

  final String headetText;


  @override
  Widget build(BuildContext context) {
    double imageWidth = MediaQuery.of(context).size.width / 2;
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        width: 170,
        child: Column(
          children: [
            Image(
                image: const AssetImage('assets/logo.png'),
                width: imageWidth
            ),
            Text(headetText, style: const TextStyle(fontSize: 30),)
          ],
        ),
      ),
    );
  }
}


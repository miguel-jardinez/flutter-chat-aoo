import 'package:flutter/material.dart';
import 'package:real_time_chat/routes/app_routes.dart';
import 'package:real_time_chat/screens/loading_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Chat app',
      debugShowCheckedModeBanner: false,
      initialRoute: 'chat',
      routes: appRoutes,
    );
  }
}

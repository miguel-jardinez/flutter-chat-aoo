
import 'package:flutter/material.dart';
import 'package:real_time_chat/screens/chat_screen.dart';
import 'package:real_time_chat/screens/loading_screen.dart';
import 'package:real_time_chat/screens/login_screen.dart';
import 'package:real_time_chat/screens/register_screen.dart';
import 'package:real_time_chat/screens/user_screen.dart';

final Map<String, Widget Function(BuildContext) > appRoutes = {
  'users': ( _ ) => const UserScreen(),
  'chat': ( _ ) => const ChatScreen(),
  'loading': ( _ ) => const LoadingScreen(),
  'register': ( _ ) => const RegisterScreen(),
  'login': ( _ ) => const LoginScreen(),
};

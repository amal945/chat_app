import 'package:flutter/material.dart';
import 'package:wori_app/register_page.dart';
import 'package:wori_app/core/theme.dart';

import 'chat_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     theme: AppTheme.darkTheme,
     //  theme: ThemeData(),
   debugShowCheckedModeBanner: false,
   home: RegisterPage(),
    );
  }
}





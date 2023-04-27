import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'page/MyHomePage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mercado',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Mercado'),
    );
  }
}
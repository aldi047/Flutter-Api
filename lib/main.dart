import 'package:flutter/material.dart';
import 'package:studi_kasus_2/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan[400],
          title: Text(
            'Kuliner Nusantara  ',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: const HomePage(),
      )),
      debugShowCheckedModeBanner: false,
    );
  }
}

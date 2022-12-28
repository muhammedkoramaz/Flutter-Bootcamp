import 'package:flutter/material.dart';
import 'package:homework_5/hesap_makinesi.dart';
import 'package:homework_5/renkler.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hesap Makinesi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        fontFamily: "Prosto",
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: anaRenk, // background (button) color
            foregroundColor: Colors.deepOrange,
            textStyle: const TextStyle(fontSize: 40),// foreground (text) color
          ),
        ),
        scaffoldBackgroundColor: anaRenk,
      ),
      home: const HesapMakinesi(),
    );
  }
}
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/constrain/views/home_page.dart';



void main() {

  runApp(ProviderScope(child: Home()));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Raleway',
        colorSchemeSeed: Colors.brown,
        // appBarTheme: AppBarTheme(
        //   color: Colors.amber
        // )
      ),
      home: HomePage(),
    );
  }
}

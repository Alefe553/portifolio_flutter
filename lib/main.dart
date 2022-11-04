import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'src/helper/preferences.dart';
import 'src/views/pages/home.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      theme: ThemeData(
        primarySwatch: Colors.grey,
        textTheme: GoogleFonts.robotoTextTheme(),
        brightness: Brightness.dark,
      ),
      home: const MyHomePage(),
    );
  }
}

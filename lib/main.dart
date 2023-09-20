import 'package:flutter/material.dart';
import 'package:retrofit_examples/presentation/home/home_page.dart';
import 'package:retrofit_examples/presentation/movie/movie_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MoviePage(),
    );
  }
}

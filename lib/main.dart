import 'package:flutter/material.dart';
import 'package:movie_player/core/services/services_locator.dart';
import 'package:movie_player/movies/presentation/screens/movies_screen.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor:Colors.grey.shade900,
      ),
      home: const MoviesScreen(),
    );
  }
}


import 'package:flutter/material.dart';
import 'ui/screens/home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          iconTheme: IconThemeData(color: Colors.amber)),
      home: HomePage(title: 'Flutter Dojo Meteo App'),
    );
  }
}

import 'package:flutter/material.dart';
import './widgets/github-search.dart';

void main() => runApp(GithubSearchApp());

class GithubSearchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Github Search',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SearchScreen(),
    );
  }
}
import 'package:flutter/material.dart';

import 'pages/ViewMenuPage.dart'; // ViewMenuPage 파일을 import
import 'pages/ViewFriendPage.dart'; // ViewFriendPage 파일을 import

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '메인 페이지',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('메인 페이지'),
          bottom: TabBar(
            tabs: [
              Tab(text: '친구'),
              Tab(text: '메뉴'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ViewFriendPage(),
            ViewMenuPage(),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

import 'pages/ViewMenuPage.dart'; 
import 'pages/ViewFriendPage.dart';
import 'pages/SplashScreenPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '메인 페이지',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreenWidget(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFF874D),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
      Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Image.asset('assets/images/icon.png', width: 200, height: 200,),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center, // 가로로 중앙 정렬
        children: [
          ElevatedButton(
            onPressed: () {
              // '친구' 버튼을 눌렀을 때의 동작 추가
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ViewFriendPage()),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 255, 219, 164), // 배경색 설정
              // onPrimary: Colors.white, // 텍스트 색상 설정
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20), // 내부 패딩
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), // 모서리 둥글게 설정
              ),
            ),
            child: Column(
              children: [
                Icon(Icons.person, size: 40, color: Colors.black), // 아이콘 추가
                SizedBox(width: 8), // 아이콘과 텍스트 사이 간격 조절
                Text(
                  '친구',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 26), // 간격 조절
          ElevatedButton(
            onPressed: () {
              // '식당' 버튼을 눌렀을 때의 동작 추가
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ViewMenuPage()),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 255, 219, 164), // 배경색 설정
              // onPrimary: Colors.white, // 텍스트 색상 설정
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20), // 내부 패딩
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), // 모서리 둥글게 설정
              ),
            ),
            child: Column(
              children: [
                Icon(Icons.restaurant_menu, size: 40, color: Colors.black), // 아이콘 추가
                SizedBox(width: 8), // 아이콘과 텍스트 사이 간격 조절
                Text(
                  '식당',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ],

        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
//import 'package:pj2/main.dart';
import 'package:pj2/pages/LoginPage.dart';

class SignupPage extends StatelessWidget {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

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
            Container(
              width: 200, // 텍스트 필드의 너비 조절
              child: TextField(
                controller: _idController,
                decoration: InputDecoration(
                  labelText: '이름을 알려주세요',
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              width: 200, // 텍스트 필드의 너비 조절
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: '비밀번호를 설정해주세요',
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              width: 200, // 텍스트 필드의 너비 조절
              child: TextField(
                controller: _emailController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: '이메일을 알려주세요',
                ),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // 자체 로그인 기능 구현
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text(
                '확인',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

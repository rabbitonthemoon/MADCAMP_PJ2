import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pj2/main.dart';
import 'package:pj2/pages/SignupPage.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _validateCredentials(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String storedUserID = prefs.getString('userID') ?? '';
    String storedPassword = prefs.getString('userPassword') ?? '';

    if (_idController.text == storedUserID && _passwordController.text == storedPassword) {
      await prefs.setString('userName', _idController.text);
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MainScreen()));
    } else {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('로그인 실패')),
      );
    }
  }

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
                  labelText: '이름',
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
                  labelText: '비밀번호',
                ),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                _validateCredentials(context);
              },
              child: Text(
                '로그인',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // 자체 로그인 기능 구현
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupPage()),
                );
              },
              child: Text(
                '회원가입',
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

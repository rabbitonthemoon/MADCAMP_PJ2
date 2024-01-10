import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pj2/pages/LoginPage.dart';

class SignupPage extends StatelessWidget {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  Future<void> _registerUser(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userID', _idController.text);
    await prefs.setString('userPassword', _passwordController.text);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('회원가입 완료')),
    );

    // Navigate to login page after successful registration
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
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
                  labelText: '이름을 입력하세요',
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
                  labelText: '비밀번호를 입력하세요',
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
                  labelText: '이메일을 입력하세요',
                ),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                _registerUser(context);
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

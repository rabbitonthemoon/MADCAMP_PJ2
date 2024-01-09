import 'package:flutter/material.dart';
import 'package:pj2/pages/LoginPage.dart';


class SplashScreenWidget extends StatefulWidget {
  @override
  _SplashScreenWidgetState createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
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
        padding: EdgeInsets.only(bottom: 10), // 원하는 패딩 값을 설정
        child: Image.asset('assets/images/icon.png', width: 200, height: 200,),
      ),
      Text(
        "카메추",
        style: TextStyle(
          //fontFamily: 'NotoSans',
          fontSize: 25.0,
        ),
      ),
      // 추가적인 자식 위젯들을 여기에 배치할 수 있습니다.
    ],
  ),
)
    );
  }
}


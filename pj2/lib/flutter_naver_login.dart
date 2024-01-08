import 'package:flutter_naver_login/flutter_naver_login.dart';

// 네이버 로그인 시작
Future<void> signInWithNaver() async {
  try {
    final NaverLoginResult result = await FlutterNaverLogin.logIn();
    switch (result.status) {
      case NaverLoginStatus.loggedIn:
        print('네이버 로그인 성공: ${result.account.email}');
        break;
      case NaverLoginStatus.cancelledByUser:
        print('네이버 로그인 사용자에 의해 취소됨');
        break;
      case NaverLoginStatus.error:
        print('네이버 로그인 에러: ${result.errorMessage}');
        break;
    }
  } catch (error) {
    print('네이버 로그인 에러: $error');
  }
}

// 네이버 로그아웃
Future<void> signOutWithNaver() async {
  await FlutterNaverLogin.logOut();
  print('네이버 로그아웃 완료');
}

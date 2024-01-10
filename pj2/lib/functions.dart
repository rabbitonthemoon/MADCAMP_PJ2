// import 'package:http/http.dart' as http;
// import 'dart:convert';

// // 기능 설명
// // input: ~~
// // output: ~~
// // Future<void> postFunc(inputType input) async {
// //   final url = Uri.parse('$baseUrl(endpoint)');
// //   try {
// //     var res = await http.post(
// //         url,
// //         headers: {'Content-Type': 'application/json'},
// //         body: json.encode({ //여기에 쓰이는 이름이 NodeJS에서 받는 이름과 같아야함
// //           '이름': 값,
// //           ...
// //         })
// //     );
// //     if (res.statusCode == 200) {
// //       // 성공적으로 업데이트 됐을 때의 로직
// //       print('Processed successfully');
// //     } else {
// //       // 서버에서 오류 응답이 온 경우
// //       print('Error processing. Status Code: ${res.statusCode}');
// //       print('Response Body: ${res.body}');
// //     }
// //   } catch (e) {
// //     print('Error: $e');
// //   }
// // }


// // 회원가입
// Future<void> signUp(String username, String password, String email) async {
//   // node -> http://localhost:3000/api/user/signUp
//   final url = Uri.parse('http://localhost:3000/api/user/signUp');
//   try {
//     final response = await http.post(
//       url,
//       headers: {'Content-Type': 'application/json'},
//       body: json.encode({
//         'username': username,
//         'passwd': password,
//         'email': email
//       }),
//     );

//     if (response.statusCode == 201) {
//       print('Signup successful');
//       // 추가적인 로직
//     } else {
//       print('Error during signup. Status Code: ${response.statusCode}');
//       print('Response Body: ${response.body}');
//     }
//   } catch (e) {
//     print('Error: $e');
//   }
// }

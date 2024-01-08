// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'models/friend.dart';

// // import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

// class NetworkService {
//   final String baseUrl = 'http://127.0.0.1:8000/';

//   Future<List<Friend>> fetchFriends() async {
//     final response = await http.get(Uri.parse('http://127.0.0.1:8000/friends'));

//     if (response.statusCode == 200) {
//       List<dynamic> friendsJson = jsonDecode(response.body) as List;
//       return friendsJson.map((json) => Friend.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to fetch friends');
//     }
//   }

//   Future<Friend> addFriend(String name, String mobile) async {
//     final response = await http.post(
//       Uri.parse('http://your-server.com/addFriend'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(<String, String>{
//         'name': name,
//         'mobile': mobile,
//       }),
//     );

//     if (response.statusCode == 200) {
//       return Friend.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('Failed to add friend');
//     }
//   }

//   // Future<List<User>> fetchUsers() async {
//   //   final response = await http.get(Uri.parse('http://<your-api-url>/users/'));

//   //   if (response.statusCode == 200) {
//   //     List<dynamic> usersJson = jsonDecode(response.body);
//   //     return usersJson.map((json) => User.fromJson(json)).toList();
//   //   } else {
//   //     throw Exception('Failed to load users');
//   //   }
//   // }

//   // Future<List<Menu>> fetchMenus() async {
//   //   final response = await http.get(Uri.parse('$baseUrl/menus'));
//   // }
// }

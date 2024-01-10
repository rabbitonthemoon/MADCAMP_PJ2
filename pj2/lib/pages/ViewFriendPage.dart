import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewFriendPage extends StatefulWidget {
  @override
  _ViewFriendPageState createState() => _ViewFriendPageState();
}

class _ViewFriendPageState extends State<ViewFriendPage> {
  // 임시 친구 목록 데이터
  final List<Map<String, dynamic>> friends = [];
  
  // 선택된 친구의 음식 목록과 먹은 횟수
  Map<String, Map<String, int>> favoriteFoods = {
    /*'친구1': {'피자': 3, '파스타': 2}, //친구1의 메뉴별 주문횟수를 DB에서 불러와야 함
    '친구2': {'김밥': 5, '떡볶이': 4}, //친구2의 메뉴별 주문횟수를 DB에서 불러와야 함
    '친구3': {'초밥': 2, '라멘': 3}*/ //친구3의 메뉴별 주문횟수를 DB에서 불러와야 함
  };
  
  String? selectedFriend;

  @override
  void initState() {
    super.initState();
    _loadFriendsFromSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        title: Text(
                  '친구',
                  style: TextStyle(
                    // fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )
              ),
        backgroundColor: Color(0xffFF874D)
      ),
      body: ListView.builder(
        itemCount: friends.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0), // 테두리를 둥글게 설정
            ),
            margin: EdgeInsets.all(8.0), // ExpansionTile 주변 여백
            child: ListTile(
              title: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(friends[index]['name'].toString()),
              ),     
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(width: 4),
                  IconButton(
                    icon: Icon(Icons.message, color: Color(0xffFF874D)),
                    onPressed: () {
                      _showSendMessageModal(friends[index]['name'].toString());
                    },
                  ),
                  SizedBox(width: 1),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.grey), // Add delete icon
                    onPressed: () {
                      _showDeleteConfirmationDialog(index);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // + 버튼을 눌렀을 때 실행될 동작
          _showAddFriendDialog();
        },
        backgroundColor: Color(0xffFFCDBA),
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> _showDeleteConfirmationDialog(int index) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('친구 삭제'),
          content: Text('삭제하시겠습니까?'),
          actions: <Widget>[
            TextButton(
              child: Text('예'),
              onPressed: () {
                setState(() {
                  String deletedFriendName = friends[index]['name'];
                  friends.removeAt(index);
                  favoriteFoods.remove(deletedFriendName);
                  _saveFriendsToSharedPreferences(); // Save updated list
                });
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('아니오'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showSendMessageModal(String friendName) async {
    TextEditingController messageController = TextEditingController();

    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // 변경된 부분
              children: [
                Text(
                  '메시지 전송',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop(); // 닫기 버튼 누를 때 모달 닫기
                  },
                ),
              ],
            ),
              SizedBox(height: 16.0),
              Text('메시지를 입력하세요:'),
              TextField(
                controller: messageController,
                maxLines: 3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      String message = messageController.text;
                      // Send the message logic (you can implement it as needed)
                      print('Sending message to $friendName: $message');
                      Navigator.of(context).pop(); // Close the modal
                    },
                    child: Text('전송'),
                  ),
                  SizedBox(width: 8.0), // Add some space between buttons
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the modal
                    },
                    child: Text('닫기'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _loadFriendsFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      friends.clear();
      favoriteFoods.clear();
      friends.addAll(prefs.getStringList('friends')?.map((friendJson) {
        Map<String, dynamic> friend = Map<String, dynamic>.from(
            Map<String, dynamic>.from(json.decode(friendJson)));
        favoriteFoods[friend['name']] = Map<String, int>.from(friend['favoriteFoods'] ?? {});
        return friend;
      }) ?? []);
    });
  }

  Future<void> _saveFriendsToSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> friendsJsonList = friends.map((friend) {
      return json.encode({'name': friend['name'], 'favoriteFoods': {}});
    }).toList();
    prefs.setStringList('friends', friendsJsonList);
  }


  // 친구 추가 다이얼로그 표시
  Future<void> _showAddFriendDialog() async {
    TextEditingController friendNameController = TextEditingController();
    TextEditingController friendEmailController = TextEditingController();

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('친구 추가'),
          content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: friendNameController,
                  decoration: InputDecoration(labelText: '친구 이름'),
                ),
                TextField(
                  controller: friendEmailController,
                  decoration: InputDecoration(labelText: '연락처'),
                ),
              ],
          ),
          
          actions: <Widget>[
            TextButton(
              child: Text('취소'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('추가'),
              onPressed: () async {
                // 입력된 친구 이름을 가져와서 추가
                String newFriendName = friendNameController.text;
                String newFriendEmail = friendEmailController.text;

                if (newFriendName.isNotEmpty && newFriendEmail.isNotEmpty) {
                  setState(() {
                    friends.add({'name': newFriendName, 'email': newFriendEmail});
                    favoriteFoods[newFriendName] = {};
                    _saveFriendsToSharedPreferences(); // 추가된 친구를 저장
                  });              
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

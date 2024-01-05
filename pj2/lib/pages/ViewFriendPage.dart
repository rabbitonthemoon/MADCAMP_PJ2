import 'package:flutter/material.dart';

class ViewFriendPage extends StatefulWidget {
  @override
  _ViewFriendPageState createState() => _ViewFriendPageState();
}

class _ViewFriendPageState extends State<ViewFriendPage> {
  // 임시 친구 목록 데이터
  final List<String> friends = ['친구1', '친구2', '친구3'];
  
  // 선택된 친구의 음식 목록과 먹은 횟수
  Map<String, Map<String, int>> favoriteFoods = {
    '친구1': {'피자': 3, '파스타': 2},
    '친구2': {'김밥': 5, '떡볶이': 4},
    '친구3': {'초밥': 2, '라멘': 3}
  };
  
  String? selectedFriend;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('친구 목록'),
      ),
      body: ListView.builder(
        itemCount: friends.length,
        itemBuilder: (context, index) {
          // 음식 목록을 먹은 횟수에 따라 정렬
          var sortedFoods = favoriteFoods[friends[index]]!.entries.toList()
            ..sort((a, b) => b.value.compareTo(a.value));
          
          return ExpansionTile(
            title: Text(friends[index]),
            children: sortedFoods.map((food) {
              return ListTile(
                title: Text('${food.key} (${food.value}번 먹음!)'),
                trailing: IconButton(
                  icon: Icon(Icons.message),
                  onPressed: () {
                    // TODO: 카카오톡 메시지 전송 기능 구현
                    print('카카오톡 메시지 전송: ${food.key}');
                  },
                ),
              );
            }).toList(),
            onExpansionChanged: (expanded) {
              if (expanded) {
                setState(() {
                  selectedFriend = friends[index];
                });
              }
            },
          );
        },
      ),
    );
  }
}

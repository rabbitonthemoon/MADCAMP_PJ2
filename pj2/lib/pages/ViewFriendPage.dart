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
    '친구1': {'피자': 3, '파스타': 2}, //친구1의 메뉴별 주문횟수를 DB에서 불러와야 함
    '친구2': {'김밥': 5, '떡볶이': 4}, //친구2의 메뉴별 주문횟수를 DB에서 불러와야 함
    '친구3': {'초밥': 2, '라멘': 3} //친구3의 메뉴별 주문횟수를 DB에서 불러와야 함
  };
  
  String? selectedFriend;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          // 음식 목록을 먹은 횟수에 따라 정렬
          var sortedFoods = favoriteFoods[friends[index]]!.entries.toList()
            ..sort((a, b) => b.value.compareTo(a.value));
          
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0), // 테두리를 둥글게 설정
            ),
            margin: EdgeInsets.all(8.0), // ExpansionTile 주변 여백
            child: ExpansionTile(
              title: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(friends[index]),
              ),
              children: sortedFoods.map((food) {
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: ListTile(
                        title: Text('${food.key}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.message, color: Color(0xffFF874D)),
                              onPressed: () {
                                print('메시지 아이콘이 눌렸습니다.');
                              },
                            ),
                            Icon(Icons.favorite, color: Colors.red),
                            SizedBox(width: 5),
                            Text('${food.value}'),
                          ],
                        ),
                      ),
                    ),
                    Divider( // 각 ListTile 사이에 Divider 추가
                      color: Colors.grey, // Divider 색상 설정
                      height: 1, // Divider의 높이 설정
                      //thickness: 1, // Divider의 두께 설정
                    ),
                  ],
                );
              }).toList(),
              onExpansionChanged: (expanded) {
                if (expanded) {
                  setState(() {
                    selectedFriend = friends[index];
                  });
                }
              },
            ),

          );

        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class StudyPage extends StatelessWidget {
  final List<List<String>> chats = [
    ['assets/study/fighters.png', "Fighters", "Shaxnoza : Ok"],
    ['assets/study/jobs.png', "UzDev Jobs – IT Jobs", "IOTA ищет Senior Golang разработчика"],
    ['assets/study/english.png', "IELTS PREPARE IN RUS & UZB", "In recent years, the architecture"],
    ['assets/study/ake.png', "Trading FX", "10 year FX Scalping Strategy in 42 seconds! "],
    ['assets/study/darslik.png', "TRADING DARSLIKLAR📊", "10minut Live yoqamiz hamma "],
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.black12)),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(chats[index][0]),
                  radius: 30,
                ),
                title: Text(chats[index][1]),
                subtitle: Text(chats[index][2], maxLines: 1, overflow: TextOverflow.ellipsis),
              ),
            ),
            if (index < 2)
              Positioned(
                right: 16,
                top: 50,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "1",
                    style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

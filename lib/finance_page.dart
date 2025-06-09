import 'package:flutter/material.dart';

class FinancePage extends StatelessWidget {
  final List<List<String>> chats = [
    ['assets/finance/class_gold.png', "Class - Trading gold 🎯🏆", "Profit until now"],
    ['assets/finance/sign_fx.png', "SIGN FX", "Yangilikka aktive bo’lilar bugun !"],
    ['assets/finance/rst.png', "R.S.T | INVEST", "KURS DUSHANBADAN BOSHLANADI! "],
    ['assets/admin.png', "Admin - TraderRyder", "Don't rade in friday!"],
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
            if (index < 1)
              Positioned(
                right: 16,
                top: 50,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "7",
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

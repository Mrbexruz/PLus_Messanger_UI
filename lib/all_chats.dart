import 'package:flutter/material.dart';

class AllChats extends StatelessWidget {
  final List<List<String>> chats = [
    ['assets/chats/kv.png', "Kun Videolari 24 | Rasmiy Kanal", "Ҳайит хурсанд бўладиган байрам,"],
    ['assets/chats/dls.png', "DLS 25 GRUPPASI ", "Obmen 22 akk bilan bir yoq"],
    ['assets/chats/stock_football.png', "STOCK FOOTBALL", "🇺🇿🏆 O‘zbekiston endi yangi bosqich,"],
    ['assets/chats/daniel.png', "DANIEL'S BLOG", "pompalolarimga hayitlik bermabmanu 😁😁"],
    ['assets/chats/group.png', "GROUP", "i don't remember"],
    ['assets/chats/trading.png', "Class - Trading gold 🎯🏆", "Not quite time to celebrate..."],
    ['assets/chats/tarona.png', "Tarona Bot | Shazam", "Danza Kuduro Remix"],
    ['assets/adhamaka.png', "Adhamaka", "Bugun nechida boshlanarekan?"],
    ['assets/admin.png', "Admin - TraderRyder", "Don't rade in friday!"],
    ['assets/ake.png', "AKE FX", "Yaxshi rahmat"],
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
            if (index < 3)
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
                    "28+",
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

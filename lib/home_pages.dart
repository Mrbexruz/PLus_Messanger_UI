import 'package:flutter/material.dart';
import 'dart:io';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  bool myValue = false;

  List<Widget> myStories = [];
  List<List<String>> chats = [];


  @override
  void initState() {
    super.initState();
    myStories = [
      buildStory('assets/bexruz.png', "My Story", isMyStory: true),
      buildStory('assets/abdumajid.png', "Abdumajid"),
      buildStory('assets/matluba.png', "AKE FX"),
      buildStory('assets/aziz.png', "Aziz ESTET"),
      buildStory('assets/abror.png', "Abror"),
      buildStory('assets/admin.png', "Admin"),
      buildStory('assets/noutbuk.png', "Noutbuk"),
      buildStory('assets/inova.png', "Shoxruh"),
      buildStory('assets/ake.png', "AKE"),
      buildStory('assets/adhamaka.png', "Adhamaka"),
    ];

    chats = [
      ['assets/chats/kv.png', "Kun Videolari 24 | Rasmiy Kanal", "Ҳайит хурсанд бўладиган байрам,"],
      ['assets/chats/dls.png', "DLS 25 GRUPPASI ", "Obmen 22 akk bilan bir yoq"],
      ['assets/chats/stock_football.png', "STOCK FOOTBALL", "🇺🇿🏆 O‘zbekiston endi yangi bosqich,"],
      ['assets/chats/daniel.png', "DANIEL'S BLOG", "Ygur yugur bilan ovora nobo'lib siz pompaloqlarimga hayitlik bermabmanu 😁😁"],
      ['assets/chats/group.png', "GROUP", "i don't remember"],
      ['assets/chats/trading.png', "Class - Trading gold 🎯🏆", "Not quite time to celebrate just yet, my friends – I still owe you plenty of pips today, "],
      ['assets/chats/tarona.png', "Tarona Bot | Shazam", "Danza Kuduro  Remix    Slowed And Reverb"],
      ['assets/adhamaka.png', "Adhamaka", "Bugun nechida boshlanarekan?"],
      ['assets/admin.png', "Admin - TraderRyder", "Don't rade in friday!"],
      ['assets/ake.png', "AKE FX", "Yaxshi rahmat"],
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: appDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.green,
        title: Text("Plus Messenger"),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 24),
        actions: [
          Icon(Icons.search, color: Colors.white),
          SizedBox(width: 18),
          Icon(Icons.folder, color: Colors.white),
          SizedBox(width: 14)
        ],
      ),
      body: Column(
        children: [
          // Storylar qismi
          Container(
            color: Colors.green,
            height: 120,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: myStories),
            ),
          ),

          // Chatlar qismi
          Expanded(
            child: ListView.builder(
              itemCount: chats.length, // Bu yerda 13 emas, chats.length bo'lishi kerak
              itemBuilder: (context, index) {
                return buildChats(index, chats[index][0], chats[index][1], chats[index][2]);
              },
            ),
          ),

        ],
      ),
      floatingActionButton: Platform.isIOS
          ? Container()
          : Stack(
        alignment: Alignment.bottomRight,
        children: [
          // Kamera tugmasi — dumaloq
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.green,
            child: Icon(Icons.camera_alt, color: Colors.white,),
            shape: CircleBorder(), // Dumaloq shakl
          ),
          // Edit tugmasi — yuqorida alohida turadi
          Positioned(
            bottom: 60, // Kamera tugmasidan yuqoriroqda turadi
            right: 8,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  )
                ],
              ),
              child: Icon(
                Icons.edit,
                size: 20,
                color: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget appDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            height: 180,
            child: DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              child: Row(
                children: [
                  SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.all(4),
                        child: CircleAvatar(
                          radius: 38,
                          backgroundImage: AssetImage('assets/bexruz.png'),
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        "MR.BEXRUZ 👨🏻‍💻",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Text(
                        "+998 91 664 15 75",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                  Spacer(), // Chap va o‘ng orasida bo‘shliq
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.dark_mode, color: Colors.white),
                      SizedBox(height: 12),
                      Icon(Icons.save, color: Colors.white),
                      SizedBox(height: 12),
                      Icon(Icons.keyboard_arrow_down, color: Colors.white),
                    ],
                  ),
                  SizedBox(width: 16),
                ],
              ),
            ),
          ),
          ListTile(
            title: Text("My Profile"),
            leading: Icon(Icons.account_circle_outlined),
          ),
          ListTile(
            title: Text("Wallet"),
            leading: Icon(Icons.wallet),
          ),
          ListTile(
            title: Text("New Group"),
            leading: Icon(Icons.group),
          ),
          ListTile(
            title: Text("New Channel"),
            leading: Icon(Icons.adb),
          ),
          ListTile(
            title: Text("Contacts"),
            leading: Icon(Icons.contacts_outlined),
          ),
          ListTile(
            title: Text("Chat Folders"),
            leading: Icon(Icons.folder),
          ),
          ListTile(
            title: Text("Saved Messages"),
            leading: Icon(Icons.message_outlined),
          ),
          ListTile(
            title: Text("Calls"),
            leading: Icon(Icons.call),
          ),
          ListTile(
            title: Text("Settings"),
            leading: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }

  Widget buildStory(String imagePath, String name, {bool isMyStory = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
       Container(
          padding: EdgeInsets.all(4),
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            Color(0xFF00BFFF), // DeepSkyBlue
            Color(0xFF1E90FF), // DodgerBlue
            Color(0xFF4682B4), // SteelBlue
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage(imagePath),
      ),
    ),
              if (isMyStory)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: Icon(
                      Icons.add,
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 6),
          Text(
            name,
            style: TextStyle(fontSize: 12, color: Colors.white),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget buildChats(int index, String imagePath, String name, String description) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12), // Chiziq
          ),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),//chat rasm
            leading: CircleAvatar(
              backgroundImage: AssetImage(imagePath),
              radius: 30,
            ),
            title: Text(name),
            subtitle: Text(
              description,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () {
              // Chat ochilsa nima bo'lishini yozish mumkin
            },
          ),
        ),
        if (index < 3)
          Positioned(
            right: 16,
            top: 50,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),//dumaloq notification
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "28+",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

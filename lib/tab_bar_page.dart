import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_drawer/all_chats.dart';
import 'package:flutter_drawer/finance_page.dart';
import 'package:flutter_drawer/study_page.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({super.key});

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  List<Widget> myStories = [];

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
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
            SizedBox(width: 14),
          ],
        ),
        body: Column(
          children: [
            // Storylar
            Container(
              color: Colors.green,
              height: 120,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: myStories),
              ),
            ),

            // Tab bar
            Container(
              color: Colors.green,
              child: const TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.wechat_sharp, color: Colors.white)),
                  Tab(icon: Icon(Icons.school, color: Colors.white)),
                  Tab(icon: Icon(Icons.monetization_on_outlined, color: Colors.white)),
                ],
              ),
            ),

            // TabBarView
            Expanded(
              child: TabBarView(
                children: [
                  AllChats(),
                  StudyPage(),
                  FinancePage(),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: Platform.isIOS
            ? Container()
            : Stack(
          alignment: Alignment.bottomRight,
          children: [
            FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.green,
              child: Icon(Icons.camera_alt, color: Colors.white),
              shape: CircleBorder(),
            ),
            Positioned(
              bottom: 60,
              right: 8,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(blurRadius: 4, offset: Offset(0, 2))],
                ),
                child: Icon(Icons.edit, size: 20, color: Colors.green),
              ),
            ),
          ],
        ),
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
                        padding: EdgeInsets.all(4),
                        child: CircleAvatar(
                          radius: 38,
                          backgroundImage: AssetImage('assets/bexruz.png'),
                        ),
                      ),
                      SizedBox(height: 12),
                      Text("MR.BEXRUZ 👨🏻‍💻", style: TextStyle(color: Colors.white)),
                      Text("+998 91 664 15 75", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Spacer(),
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
          ListTile(title: Text("My Profile"), leading: Icon(Icons.account_circle_outlined)),
          ListTile(title: Text("Wallet"), leading: Icon(Icons.wallet)),
          ListTile(title: Text("New Group"), leading: Icon(Icons.group)),
          ListTile(title: Text("New Channel"), leading: Icon(Icons.adb)),
          ListTile(title: Text("Contacts"), leading: Icon(Icons.contacts_outlined)),
          ListTile(title: Text("Chat Folders"), leading: Icon(Icons.folder)),
          ListTile(title: Text("Saved Messages"), leading: Icon(Icons.message_outlined)),
          ListTile(title: Text("Calls"), leading: Icon(Icons.call)),
          ListTile(title: Text("Settings"), leading: Icon(Icons.settings)),
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
                    colors: [Color(0xFF00BFFF), Color(0xFF1E90FF), Color(0xFF4682B4)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: CircleAvatar(radius: 30, backgroundImage: AssetImage(imagePath)),
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
                    child: Icon(Icons.add, size: 18, color: Colors.white),
                  ),
                ),
            ],
          ),
          SizedBox(height: 6),
          Text(name, style: TextStyle(fontSize: 12, color: Colors.white), overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}

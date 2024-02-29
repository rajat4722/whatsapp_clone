import 'package:flutter/material.dart';
import 'package:whatsapp_clone/presentation/screens/calls_screen.dart';
import 'package:whatsapp_clone/presentation/screens/chat_screen.dart';
import 'package:whatsapp_clone/presentation/screens/community.dart';
import 'package:whatsapp_clone/presentation/screens/updates_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "WhatsApp",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 0, 19, 17),
          bottom: const TabBar(
            unselectedLabelColor: Colors.white,
            indicatorWeight: 3,
            labelStyle: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            indicatorColor: Color(0xff25D366),
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(icon: Icon(Icons.groups_outlined)),
              Tab(text: "Chats"),
              Tab(text: "Updates"),
              Tab(text: "Calls"),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.camera_alt_rounded, color: Colors.white),
              onPressed: () {
                // Add your camera functionality here
              },
            ),
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: () {
                // Add your search functionality here
              },
            ),
            IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.white),
              onPressed: () {
                // Add your more options functionality here
              },
            ),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[];
          },
          body: const TabBarView(
            children: [
              CommunityScreen(),
              ChatsScreen(),
              UpdatesScreen(),
              CallsScreen(),
            ],
          ),
        ),
      ),
    );
  }
}

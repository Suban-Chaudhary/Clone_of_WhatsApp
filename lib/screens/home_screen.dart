import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/pageviews/chat_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  TabController tabController;
  
  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal[500],
        onPressed: () {},
        child: Icon(
          Icons.message,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        title: Text(
          "WhatsApp",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.teal[800],
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
        bottom: TabBar(
          isScrollable: true,
          tabs: [
            Container(
              width: MediaQuery.of(context).size.width * 0.05,
              child: Tab(
                icon: Icon(
                  Icons.camera_alt,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.21,
              child: Tab(child: Text("CHATS")),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.21,
              child: Tab(child: Text("STATUS")),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.21,
              child: Tab(child: Text("CALLS")),
            ),
          ],
          controller: tabController,
          indicatorColor: Colors.white,
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Center(child: Text("Camera")),
          Center(child: ChatListScreen()),
          Center(child: Text("Status")),
          Center(child: Text("Calls")),
        ],
      ),
    );
  }
}

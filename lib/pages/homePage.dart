import 'package:flutter/material.dart';
import 'package:vultr/components/cards.dart';
import 'chatbot.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 110,
        title: Row(
          children: [
            Expanded(
              child: Text(
                "Vultr Project",
                style: TextStyle(color: Colors.black),
              ),
              flex: 1,
            ),
            Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.only(top: 10),
                height: 50.0,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'Search...',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Icon(
                        Icons.search,
                        size: 24.0,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.mail, color: Colors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.notification_add, color: Colors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.person, color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                // Handle Home tap
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('About'),
              onTap: () {
                // Handle About tap
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Services'),
              onTap: () {
                // Handle Services tap
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Contact'),
              onTap: () {
                // Handle Contact tap
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Wrap(
              spacing: 16.0, // Increased horizontal spacing between tags
              runSpacing: 8.0, // Increased vertical spacing between lines
              children: <Widget>[
                Chip(label: Text('Stress')),
                Chip(label: Text('Anxiety')),
                Chip(label: Text('Laziness')),
                Chip(label: Text('Depression')),
                Chip(label: Text('Panic')),
                Chip(label: Text('Sleep Deprived')),
                Chip(label: Text('Concentraion')),
                Chip(label: Text('Fear')),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                Text("Continue Watching"),
                Spacer(),
                Text("View All"),
              ],
            ),
          ),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child:
              Row(
                children: [
                  myCard(),
                  myCard(),
                  myCard(),
                  myCard(),]),),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                Text("Recommended"),
                Spacer(),
                Text("View All"),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
               myCard2(),
              myCard2(),
               myCard2(),
                myCard2(),
                myCard2(),

              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                myCard2(),
                myCard2(),
                myCard2(),
                myCard2(),
                myCard2(),

              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                myCard2(),
                myCard2(),
                myCard2(),
                myCard2(),
                myCard2(),


              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                myCard2(),
                myCard2(),
                myCard2(),
                myCard2(),
                myCard2(),


              ],
            ),
          )
        ],//main list
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(

        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ChatBotPage()),
          );
        },
        child: Icon(Icons.chat),
        backgroundColor: Colors.white,  // Customize the color as needed
      )
      ,
    );


  }
}
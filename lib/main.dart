import 'package:flutter/material.dart';
import 'package:first_program/actus.dart';
import 'appels.dart';
import 'groups.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "WhatsApp",
      home: MainScreen(), // Change here to start from MainScreen
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0; // Index for the selected page

  // Pages to display in IndexedStack
  final List<Widget> _pages = [
    const ChatScreen(),
    const ActusScreen(),
    const GroupsScreen(),
    const CallScreen(),
  ];

  // Select the button in the ElevatedButton row

  // Change the selected index on BottomNavigationBar tap
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.white,
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat,
              color: Colors.black,
            ),
            label: 'Discussions',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.sms_rounded,
              color: Colors.black,
            ),
            label: 'Actus',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.groups,
              color: Colors.black,
            ),
            label: 'Communautés',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.call,
              color: Colors.black,
            ),
            label: 'Appels',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Map<String, String>> messages = [
    {"name": "Alice", "message": "Salut, ça va?"},
    {"name": "Bob", "message": "Tu as reçu mon fichier ?"},
    {"name": "Charlie", "message": "On se voit demain."},
    {"name": "Diane", "message": "Je suis en route."},
    {"name": "Tom", "message": "Salut, ça va?"},
    {"name": "Arthur", "message": "Tu as reçu mon fichier ?"},
    {"name": "François", "message": "On se voit demain."},
    {"name": "Marie", "message": "Je suis en route."},
    {"name": "Jean", "message": "Passe une bonne soirée."},
    {"name": "Louise", "message": "Je te rappelerai."},
    {
      "name": "Mathieu",
      "message":
          "Les affaires vont bon train. Bientôt je serai parmi les grands."
    },
  ];

  int _selectedButtonIndex = 0;

  void _selectButton(int index) {
    setState(() {
      _selectedButtonIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "WhatsApp",
          style: TextStyle(
            color: Colors.green,
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt),
            onPressed: () {},
            color: Colors.black,
            iconSize: 30,
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
            color: Colors.black,
            iconSize: 30,
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Nouveau groupe',
                child: Text('Nouveau groupe'),
              ),
              const PopupMenuItem<String>(
                value: 'Nouvelle diffusion',
                child: Text('Nouvelle diffusion'),
              ),
              const PopupMenuItem<String>(
                value: 'Appareils connectés',
                child: Text('Appareils connectés'),
              ),
              const PopupMenuItem<String>(
                value: 'Messages importants',
                child: Text('Messages importants'),
              ),
              const PopupMenuItem<String>(
                value: 'Paramètres',
                child: Text('Paramètres'),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          const Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedButtonIndex == 0
                        ? Colors.green
                        : Colors.grey[300],
                    minimumSize: const Size(75, 30),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  ),
                  onPressed: () => _selectButton(0),
                  child: const Text(
                    "Toutes",
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedButtonIndex == 1
                        ? Colors.green
                        : Colors.grey[300],
                    minimumSize: const Size(75, 30),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  ),
                  onPressed: () => _selectButton(1),
                  child: const Text(
                    "Non lues",
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedButtonIndex == 2
                        ? Colors.green
                        : Colors.grey[300],
                    minimumSize: const Size(75, 30),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  ),
                  onPressed: () => _selectButton(2),
                  child: const Text(
                    "Favoris",
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedButtonIndex == 3
                        ? Colors.green
                        : Colors.grey[300],
                    minimumSize: const Size(75, 30),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  ),
                  onPressed: () => _selectButton(3),
                  child: const Text(
                    "Groupes",
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                    radius: 20,
                    child: Icon(
                      Icons.person,
                      color: Colors.black,
                      size: 28,
                    ),
                  ),
                  title: Text(
                    messages[index]['name'] ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  subtitle: Text(messages[index]['message'] ?? ''),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: const FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: null,
        tooltip: '',
        child: Icon(
          Icons.add_comment,
          color: Colors.white,
        ),
      ),
    );
  }
}

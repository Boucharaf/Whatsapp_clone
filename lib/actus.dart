import 'package:flutter/material.dart';

class ActusScreen extends StatelessWidget {
  const ActusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Actus",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert),
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: 'Confidentialité de statut',
                      child: Text('Confidentialité de statut'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'Créer une chaine',
                      child: Text('Créer une chaine'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'Paramètres',
                      child: Text('Paramètres'),
                    ),
                  ]),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Statut',
              style: TextStyle(
                fontSize: 23,
                color: Colors.black,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                12,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(1.8),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.green, width: 2.5),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.grey[300],
                              child: index == 11
                                  ? const Text(
                                      '>',
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  : const Icon(Icons.person_2_outlined),
                            ),
                          ),
                          if (index == 0)
                            Positioned(
                              bottom: -5,
                              right: 10,
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green,
                                  border:
                                      Border.all(color: Colors.white, width: 1),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      if (index == 0)
                        const Text(
                          'Mon statut',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      if (index == 11)
                        const Text(
                          'Manqués',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      if (index != 0 && index != 11)
                        Text(
                          'Numéro ${index + 1}',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Chaînes', style: TextStyle(fontSize: 20)),
                TextButton(
                    onPressed: null,
                    child: Text(
                      'Découvrir  >',
                      style: TextStyle(color: Colors.green, fontSize: 20),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

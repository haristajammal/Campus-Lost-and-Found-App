
import 'package:flutter/material.dart';
void main() {
  runApp(
      MyApp()
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Lost & Found',
      home: HomeScreen(),
    );
  }
}
class LostItem {
  String name;
  String location;
  String status;
  String description;

  LostItem(
      this.name,
      this.location,
      this.status,
      this.description,
      );
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final List<LostItem> items = [
    LostItem(
      'Black Wallet',
      'University Library',
      'Lost',
      'A black leather wallet containing student cards.',
    ),
    LostItem(
      'Water Bottle',
      'Computer Lab',
      'Found',
      'A blue water bottle was found on a computer desk.',
    ),
    LostItem(
      'Student ID Card',
      'Cafeteria',
      'Lost',
      'A student ID card was lost near the cafeteria.',
    ),
    LostItem(
      'Laptop Charger',
      'Classroom 101',
      'Found',
      'A laptop charger was found after the lecture.',
    ),
    LostItem(
      'Mobile Phone',
      'Sports Ground',
      'Lost',
      'A mobile phone was reported missing.',
    ),
    LostItem(
      'Notebook',
      'Main Auditorium',
      'Found',
      'A notebook was found on an auditorium seat.',
    ),
    LostItem(
      'Car Keys',
      'Parking Area',
      'Lost',
      'A set of car keys with a keychain.',
    ),
    LostItem(
      'Headphones',
      'Student Lounge',
      'Found',
      'Black wireless headphones were found.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Campus Lost & Found'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Lost Something? Find It Here!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];

                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: ListTile(
                    leading: const CircleAvatar(
                      child: Icon(Icons.inventory_2),
                    ),

                    title: Text(
                      item.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Location: ${item.location}'),
                        Text(
                          'Status: ${item.status}',
                          style: TextStyle(
                            color: item.status == 'Lost'
                                ? Colors.red
                                : Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    trailing: ElevatedButton(
                      child: const Text('Details'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              item: item,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
class DetailsScreen extends StatelessWidget {
  final LostItem item;

  const DetailsScreen({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: Card(
          margin: const EdgeInsets.all(20),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(25),

            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Icon(
                    Icons.inventory_2,
                    size: 80,
                    color: Colors.blue,
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  'Item Name: ${item.name}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                Text(
                  'Location: ${item.location}',
                  style: const TextStyle(fontSize: 17),
                ),

                const SizedBox(height: 15),

                Text(
                  'Status: ${item.status}',
                  style: const TextStyle(fontSize: 17),
                ),

                const SizedBox(height: 15),

                Text(
                  'Description: ${item.description}',
                  style: const TextStyle(fontSize: 17),
                ),

                const SizedBox(height: 25),

                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Go Back'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

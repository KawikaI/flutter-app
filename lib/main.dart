import 'package:flutter/material.dart';
import 'models/deck.dart';
import 'screens/deck_detail_screen.dart';
import 'screens/card_search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deck Builder',
      debugShowCheckedModeBanner: false, // Removes the debug banner
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Sample deck data
  final List<Deck> decks = [
    Deck(
      title: 'Blue Control',
      description: 'A control deck built around counterspells.',
    ),
    Deck(
      title: 'Red Aggro',
      description: 'An aggressive deck focused on fast damage.',
    ),
    Deck(
      title: 'Green Ramp',
      description: 'Ramp up to huge creatures quickly.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deck Builder'),
      ),
      body: ListView.builder(
        itemCount: decks.length,
        itemBuilder: (context, index) {
          final deck = decks[index];
          return Card(
            margin: const EdgeInsets.all(10),
            elevation: 3,
            child: ListTile(
              title: Text(
                deck.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(deck.description),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to deck details
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DeckDetailScreen(deck: deck),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        // Global search button to open the CardSearchScreen
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CardSearchScreen()),
          );
        },
        child: const Icon(Icons.search),
      ),
    );
  }
}
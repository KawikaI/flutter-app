import 'package:flutter/material.dart';
import 'models/deck.dart';
import 'screens/deck_detail_screen.dart';
import 'screens/card_search_screen.dart';
import 'screens/create_deck_screen.dart';
import 'screens/prefab_deck_screen.dart'; // optional, if you want prefab screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deck Builder',
      debugShowCheckedModeBanner: false, // remove debug banner
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
  // Start with three decks (prefabs)
  final List<Deck> decks = [
    Deck(title: 'Blue Control', description: 'A control deck built around counterspells.'),
    Deck(title: 'Red Aggro', description: 'An aggressive deck focused on fast damage.'),
    Deck(title: 'Green Ramp', description: 'Ramp up to huge creatures quickly.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deck Builder'),
        actions: [
          // Button to create a new custom deck
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              // Navigate to create deck screen
              final newDeck = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreateDeckScreen()),
              );
              if (newDeck != null && newDeck is Deck) {
                setState(() {
                  decks.add(newDeck);
                });
              }
            },
          ),
          // (Optional) Button to clone a prefab deck
          IconButton(
            icon: const Icon(Icons.library_books),
            onPressed: () async {
              // Show a screen (or dialog) of prefab decks to pick from
              final clonedDeck = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PrefabDeckScreen()),
              );
              if (clonedDeck != null && clonedDeck is Deck) {
                setState(() {
                  decks.add(clonedDeck);
                });
              }
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: decks.length,
        itemBuilder: (context, index) {
          final deck = decks[index];
          return Card(
            margin: const EdgeInsets.all(10),
            elevation: 3,
            child: ListTile(
              title: Text(deck.title, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(deck.description),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to deck detail
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
      // Keep the global search FAB
      floatingActionButton: FloatingActionButton(
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
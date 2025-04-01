// lib/screens/prefab_deck_screen.dart
import 'package:flutter/material.dart';
import '../models/deck.dart';

class PrefabDeckScreen extends StatelessWidget {
  PrefabDeckScreen({Key? key}) : super(key: key);

  // Some prefab decks you might want to let the user clone
  final List<Deck> prefabDecks = [
    Deck(
      title: 'Black Reanimator',
      description: 'Bring creatures back from the graveyard!',
    ),
    Deck(
      title: 'White Weenie',
      description: 'Small creatures that swarm the battlefield quickly.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Choose a Prefab Deck')),
      body: ListView.builder(
        itemCount: prefabDecks.length,
        itemBuilder: (context, index) {
          final deck = prefabDecks[index];
          return Card(
            margin: const EdgeInsets.all(10),
            elevation: 3,
            child: ListTile(
              title: Text(deck.title),
              subtitle: Text(deck.description),
              onTap: () {
                // Clone this deck and pop back
                Navigator.pop(context, deck.clone());
              },
            ),
          );
        },
      ),
    );
  }
}
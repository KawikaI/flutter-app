// lib/screens/deck_detail_screen.dart
import 'package:flutter/material.dart';
import '../models/deck.dart';

class DeckDetailScreen extends StatefulWidget {
  final Deck deck;

  const DeckDetailScreen({Key? key, required this.deck}) : super(key: key);

  @override
  _DeckDetailScreenState createState() => _DeckDetailScreenState();
}

class _DeckDetailScreenState extends State<DeckDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.deck.title)),
      body: widget.deck.cards.isEmpty
          ? const Center(child: Text('No cards in this deck yet.'))
          : ListView.builder(
              itemCount: widget.deck.cards.length,
              itemBuilder: (context, index) {
                final card = widget.deck.cards[index];
                final cardName = card['name'] ?? 'Unknown';
                final cardType = card['type_line'] ?? '';
                return ListTile(
                  leading: card.containsKey('image_uris') && 
                           card['image_uris'] != null &&
                           card['image_uris']['small'] != null
                      ? Image.network(
                          card['image_uris']['small'],
                          // No fixed width/height is provided here,
                          // letting the image size adjust naturally.
                          fit: BoxFit.contain,
                        )
                      : const Icon(Icons.image_not_supported),
                  title: Text(cardName),
                  subtitle: Text(cardType),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      // Remove this card
                      setState(() {
                        widget.deck.cards.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Example: Open a screen to search and add cards.
          final selectedCard = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => /* CardSearchScreen() */ Container()),
          );
          if (selectedCard != null) {
            setState(() {
              widget.deck.cards.add(selectedCard);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
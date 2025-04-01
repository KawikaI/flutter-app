import 'package:flutter/material.dart';
import '../models/deck.dart';
import 'card_search_screen.dart';

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
      appBar: AppBar(
        title: Text(widget.deck.title),
      ),
      body: ListView.builder(
        itemCount: widget.deck.cards.length,
        itemBuilder: (context, index) {
          final card = widget.deck.cards[index];
          final imageUrl = card['image_uris']?['small'];
          final cardName = card['name'] ?? 'Unknown';
          final cardType = card['type_line'] ?? '';

          return ListTile(
            leading: imageUrl != null
                ? Image.network(imageUrl)
                : const Icon(Icons.image_not_supported),
            title: Text(cardName),
            subtitle: Text(cardType),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Push the search screen and wait for the user to pick a card
          final selectedCard = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CardSearchScreen()),
          );

          // If a card was returned, add it to the current deck
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
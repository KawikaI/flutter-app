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
        centerTitle: true,
      ),
      body: widget.deck.cards.isEmpty
          ? const Center(child: Text('No cards in this deck yet.'))
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: widget.deck.cards.length,
              itemBuilder: (context, index) {
                final card = widget.deck.cards[index];
                final cardName = card['name'] ?? 'Unknown';
                final cardType = card['type_line'] ?? '';
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12),
                    leading: card['image_uris']?['small'] != null
                        ? Image.network(
                            card['image_uris']['small'],
                            fit: BoxFit.contain,
                          )
                        : const Icon(Icons.image_not_supported),
                    title: Text(cardName),
                    subtitle: Text(cardType),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          widget.deck.cards.removeAt(index);
                        });
                      },
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final selectedCard = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CardSearchScreen()),
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
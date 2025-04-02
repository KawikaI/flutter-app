import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CardSearchScreen extends StatefulWidget {
  const CardSearchScreen({Key? key}) : super(key: key);

  @override
  _CardSearchScreenState createState() => _CardSearchScreenState();
}

class _CardSearchScreenState extends State<CardSearchScreen> {
  String query = '';
  bool isLoading = false;
  List<dynamic> cards = [];

  Future<void> searchCards(String query) async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await http.get(
        Uri.parse('https://api.scryfall.com/cards/search?q=$query'),
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          cards = data['data'] ?? [];
        });
      }
    } catch (e) {
      print('Error searching cards: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Cards'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              onChanged: (val) => query = val,
              onSubmitted: (val) => searchCards(val),
              decoration: InputDecoration(
                labelText: 'Enter card name...',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () => searchCards(query),
                ),
              ),
            ),
          ),
          if (isLoading) const CircularProgressIndicator(),
          Expanded(
            child: ListView.builder(
              itemCount: cards.length,
              itemBuilder: (context, index) {
                final card = cards[index];
                final name = card['name'] ?? 'Unknown';
                final imageUrl = card['image_uris']?['small'];
                final typeLine = card['type_line'] ?? '';
                return ListTile(
                  leading: imageUrl != null
                      ? Image.network(imageUrl)
                      : const Icon(Icons.image_not_supported),
                  title: Text(name),
                  subtitle: Text(typeLine),
                  onTap: () {
                    Navigator.pop(context, card);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
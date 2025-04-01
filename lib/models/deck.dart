// lib/models/deck.dart
class Deck {
  final String title;
  final String description;
  final List<dynamic> cards; // Holds card data (e.g., from Scryfall or hard-coded)

  Deck({
    required this.title,
    required this.description,
    List<dynamic>? cards,
  }) : cards = cards ?? [];

  // Optional clone method if you need to duplicate decks
  Deck clone() {
    return Deck(
      title: title,
      description: description,
      cards: List.from(cards),
    );
  }
}
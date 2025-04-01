class Deck {
  final String title;
  final String description;
  final List<dynamic> cards; // We'll store raw JSON from Scryfall for simplicity

  Deck({
    required this.title,
    required this.description,
    List<dynamic>? cards,
  }) : cards = cards ?? [];
}
class Deck {
  final String title;
  final String description;
  final List<dynamic> cards; // Storing card JSON from Scryfall

  Deck({
    required this.title,
    required this.description,
    List<dynamic>? cards,
  }) : cards = cards ?? [];

  // Optional: a quick way to clone an existing deck
  Deck clone() {
    return Deck(
      title: title,
      description: description,
      cards: List.from(cards),
    );
  }
}
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
      debugShowCheckedModeBanner: false,
      // Using the default blue theme; you can customize later.
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
  final List<Deck> decks = [
    // Blue Control deck with 5 cards
    Deck(
      title: 'Blue Control',
      description: 'A control deck built around counterspells.',
      cards: [
        {
          'name': 'Harbinger of the Seas',
          'type_line': 'Creature — Merfolk Wizard',
          'image_uris': {
            'small': 'https://cards.scryfall.io/large/front/0/0/00212714-a410-4cbc-bf1c-f90d7d77378c.jpg?1717470489'
          },
        },
        {
          'name': 'Counterspell',
          'type_line': 'Instant',
          'image_uris': {
            'small': 'https://cards.scryfall.io/large/front/4/f/4f616706-ec97-4923-bb1e-11a69fbaa1f8.jpg?1726837907'
          },
        },
        {
          'name': 'Brainstorm',
          'type_line': 'Instant',
          'image_uris': {
            'small': 'https://cards.scryfall.io/large/front/8/b/8beb987c-1b67-4a4e-ae71-58547afad2a0.jpg?1726284649'
          },
        },
        {
          'name': 'Snapcaster Mage',
          'type_line': 'Creature — Human Wizard',
          'image_uris': {
            'small': 'https://cards.scryfall.io/large/front/7/e/7e41765e-43fe-461d-baeb-ee30d13d2d93.jpg?1547516526'
          },
        },
        {
          'name': 'Jace, the Mind Sculptor',
          'type_line': 'Planeswalker — Jace',
          'image_uris': {
            'small': 'https://cards.scryfall.io/large/front/c/8/c8817585-0d32-4d56-9142-0d29512e86a9.jpg?1598304029'
          },
        },
      ],
    ),
    // Red Aggro deck with 5 cards
    Deck(
      title: 'Red Aggro',
      description: 'An aggressive deck focused on fast damage.',
      cards: [
        {
          'name': 'Goblin Guide',
          'type_line': 'Creature — Goblin Scout',
          'image_uris': {
            'small': 'https://cards.scryfall.io/large/front/3/c/3c0f5411-1940-410f-96ce-6f92513f753a.jpg?1599706366'
          },
        },
        {
          'name': 'Lightning Bolt',
          'type_line': 'Instant',
          'image_uris': {
            'small': 'https://cards.scryfall.io/large/front/7/7/77c6fa74-5543-42ac-9ead-0e890b188e99.jpg?1706239968'
          },
        },
        {
          'name': 'Monastery Swiftspear',
          'type_line': 'Creature — Human Warrior',
          'image_uris': {
            'small': 'https://cards.scryfall.io/large/front/d/6/d6bfa227-4309-40ed-952c-279595eab17e.jpg?1701690543'
          },
        },
        {
          'name': 'Raging Goblin',
          'type_line': 'Creature — Goblin Warrior',
          'image_uris': {
            'small': 'https://cards.scryfall.io/large/front/3/4/3480927c-10da-4817-9954-10aea2bc7100.jpg?1605206526'
          },
        },
        {
          'name': 'Chandra, Torch of Defiance',
          'type_line': 'Planeswalker — Chandra',
          'image_uris': {
            'small': 'https://cards.scryfall.io/large/front/2/e/2eac0eaa-55b2-444a-863d-c66769aab4ee.jpg?1690004652'
          },
        },
      ],
    ),
    // Green Ramp deck with 5 cards
    Deck(
      title: 'Green Ramp',
      description: 'Ramp up to huge creatures quickly.',
      cards: [
        {
          'name': 'Llanowar Elves',
          'type_line': 'Creature — Elf Druid',
          'image_uris': {
            'small': 'https://cards.scryfall.io/large/front/6/a/6a0b230b-d391-4998-a3f7-7b158a0ec2cd.jpg?1731652605'
          },
        },
        {
          'name': 'Cultivate',
          'type_line': 'Sorcery',
          'image_uris': {
            'small': 'https://cards.scryfall.io/large/front/6/b/6bb4dff5-4486-4ba5-9b85-9f005d988108.jpg?1743206911'
          },
        },
        {
          'name': "Kodama's Reach",
          'type_line': 'Sorcery',
          'image_uris': {
            'small': 'https://cards.scryfall.io/large/front/8/4/84c27ded-a0f6-4965-8a44-e87f0972d1d8.jpg?1743206957'
          },
        },
        {
          'name': "Nature's Lore",
          'type_line': 'Sorcery',
          'image_uris': {
            'small': 'https://cards.scryfall.io/large/front/f/5/f5615c05-eb1e-4d27-a323-72d643d7c1d8.jpg?1706547171'
          },
        },
        {
          'name': 'Explosive Vegetation',
          'type_line': 'Sorcery',
          'image_uris': {
            'small': 'https://cards.scryfall.io/large/front/8/d/8de3fdf8-d55e-4ffc-8f8b-6314d4d467ce.jpg?1726285016'
          },
        },
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Deck Builder'),
        actions: [
          // Button to create a new custom deck with a name/description
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) {
                  final deckNameController = TextEditingController();
                  final deckDescController = TextEditingController();
                  return AlertDialog(
                    title: const Text('Create New Deck'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: deckNameController,
                          decoration: const InputDecoration(labelText: 'Deck Name'),
                        ),
                        TextField(
                          controller: deckDescController,
                          decoration: const InputDecoration(labelText: 'Deck Description'),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancel'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          final newDeck = Deck(
                            title: deckNameController.text.isNotEmpty
                                ? deckNameController.text
                                : 'Untitled Deck',
                            description: deckDescController.text,
                            cards: [],
                          );
                          setState(() {
                            decks.add(newDeck);
                          });
                          Navigator.pop(context);
                        },
                        child: const Text('Create'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          // Button to clone prefab decks (cloning the first deck as an example)
          IconButton(
            icon: const Icon(Icons.library_books),
            onPressed: () {
              if (decks.isNotEmpty) {
                final clonedDeck = Deck(
                  title: '${decks[0].title} (Clone)',
                  description: decks[0].description,
                  cards: List.from(decks[0].cards),
                );
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
              title: Text(
                deck.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(deck.description),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
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
        child: const Icon(Icons.search),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CardSearchScreen()),
          );
        },
      ),
    );
  }
}
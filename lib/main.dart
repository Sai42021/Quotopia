import 'dart:math';

import 'package:flutter/material.dart';
import 'Screens/quotes_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: const RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  List<String> images = [
    'images/bob_marley.jpg',
    'images/mlk.jpg',
    'images/barrack_obama.jpg',
    'images/harriet_tubman.jpg',
    'images/lucky_dube.jpg',
    'images/maya_angelou.jpg',
    'images/michelle_obama.jpg',
    'images/nelson_mandela.jpg',
    'images/rosa_parks.jpg',
    'images/malcolm_x.jpg',
  ];

  int currentPage = 0;
  int currentIndex = 0;
  String displayedQuote = '';

  void goToPreviousImage() {
    setState(() {
      currentIndex = (currentIndex - 1) % images.length;
      displayRandomQuote();
    });
  }

  void goToNextImage() {
    setState(() {
      currentIndex = (currentIndex + 1) % images.length;
      displayRandomQuote();
    });
  }

  void displayRandomQuote() {
    if (currentIndex == 1) {
      final randomIndex = Random().nextInt(mlkQuotes.length);
      displayedQuote = mlkQuotes[randomIndex];
    } else if (currentIndex == 2) {
      final randomIndex = Random().nextInt(barrackObamaQuotes.length);
      displayedQuote = barrackObamaQuotes[randomIndex];
    } else if (currentIndex == 3) {
      final randomIndex = Random().nextInt(harietTubmanQuotes.length);
      displayedQuote = harietTubmanQuotes[randomIndex];
    } else if (currentIndex == 4) {
      final randomIndex = Random().nextInt(luckyDubeQuotes.length);
      displayedQuote = luckyDubeQuotes[randomIndex];
    } else if (currentIndex == 5) {
      final randomIndex = Random().nextInt(mayaAngelouQuotes.length);
      displayedQuote = mayaAngelouQuotes[randomIndex];
    } else if (currentIndex == 6) {
      final randomIndex = Random().nextInt(michelleObamaQuotes.length);
      displayedQuote = michelleObamaQuotes[randomIndex];
    } else if (currentIndex == 7) {
      final randomIndex = Random().nextInt(nelsonMandelaQuotes.length);
      displayedQuote = nelsonMandelaQuotes[randomIndex];
    } else if (currentIndex == 8) {
      final randomIndex = Random().nextInt(rosaParksQuotes.length);
      displayedQuote = rosaParksQuotes[randomIndex];
    } else if (currentIndex == 9) {
      final randomIndex = Random().nextInt(malcolmXQuotes.length);
      displayedQuote = malcolmXQuotes[randomIndex];
    } else {
      final randomIndex = Random().nextInt(bobMarleyQuotes.length);
      displayedQuote = bobMarleyQuotes[randomIndex];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quotopia'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              images[currentIndex],
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            const Divider(
              color: Colors.black,
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(10.0),
              color: Colors.grey.shade800,
              width: double.infinity,
              child: Center(
                child: Text(
                  displayedQuote,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                      goToPreviousImage();
                      displayRandomQuote();
                    }),
                IconButton(
                    icon: const Icon(Icons.arrow_forward),
                    onPressed: () {
                      goToNextImage();
                      displayRandomQuote();
                    }),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.short_text), label: 'Quotes'),
          NavigationDestination(icon: Icon(Icons.checklist), label: 'Saved'),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }
}

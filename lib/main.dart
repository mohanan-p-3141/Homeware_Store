import 'package:flutter/material.dart';
import 'package:home_web/homewareproducts_page.dart';
import 'package:home_web/search_page..dart';
import 'package:lottie/lottie.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homeware Website',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homewares'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const HeaderSection(),
            GestureDetector(
              onTap: () {
                // Navigate to the homeware products page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const HomewareProductsPage()), // Change to HomewareProductsPage
                );
              },
              child: const AnimationSection(),
            ),
            const SizedBox(height: 16),
            const CheckWeatherButton(),
          ],
        ),
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.blue,
      child: const Text(
        'Welcome to NestifyHome',
        style: TextStyle(
          fontSize: 24,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class AnimationSection extends StatelessWidget {
  const AnimationSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: double.infinity, // Fill the entire width of the screen
            height: double.infinity,
            child: Lottie.network(
              'https://lottie.host/91ed4faf-89db-4c6f-962f-994d27f872d1/PAQ3pfu2YA.json',
              fit: BoxFit.cover,
            ),
          ),
          const Positioned(
            child: Text(
              'Introducing Modern Home Shop The Collections',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(161, 208, 168, 7),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CheckWeatherButton extends StatelessWidget {
  const CheckWeatherButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SearchBarPage()),
          );
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        ),
        child: const Text(
          'Check Weather',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

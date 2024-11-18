import 'package:flutter/material.dart';

// Define a list of products
final List<Product> homewareProducts = [
  Product(
    name: 'Chairs Start at 499',
    imageUrl: 'assets/images/product1.png', // Assuming you have image assets
  ),
  Product(
    name: 'Tables Start at 649',
    imageUrl: 'assets/images/talbe.jpeg',
  ),
  Product(
    name: 'Sofas Start at 4999',
    imageUrl: 'assets/images/sofa.png',
  ),
  Product(
    name: 'TV Stands Start at 999',
    imageUrl: 'assets/images/tvstands.jpeg',
  ),
  Product(
    name: 'Wardrobe Start at 2499',
    imageUrl: 'assets/images/wardrobe.jpg',
  ),
  Product(
    name: 'NightStands Start at 1299',
    imageUrl: 'assets/images/nightstands.jpeg',
  ),
  Product(
    name: 'Kitchen Appliances Start at 1499',
    imageUrl: 'assets/images/kitchen.jpg',
  ),
  Product(
    name: 'Dressers Start at 2999',
    imageUrl: 'assets/images/dressers.jpg',
  ),
  Product(
    name: 'DinningTables Start at 1499',
    imageUrl: 'assets/images/dinningtable.png',
  ),
  Product(
    name: 'Desks Start at 499',
    imageUrl: 'assets/images/desk.jpg',
  ),
  Product(
    name: 'CoffeeTables Start at 399',
    imageUrl: 'assets/images/coffeetable.png',
  ),
  Product(
    name: 'Books Shelves Start at 1799',
    imageUrl: 'assets/images/Books-.webp',
  ),
  // Add more products as needed
];

class Product {
  final String name;
  final String imageUrl;

  Product({
    required this.name,
    required this.imageUrl,
  });

  toLowerCase() {}
}

class HomewareProductsPage extends StatefulWidget {
  const HomewareProductsPage({Key? key}) : super(key: key);

  @override
  _HomewareProductsPageState createState() => _HomewareProductsPageState();
}

class _HomewareProductsPageState extends State<HomewareProductsPage> {
  String _searchQuery = '';

  List<Product> getFilteredProducts() {
    return homewareProducts
        .where((product) =>
            product.name.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homeware Products'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, // Adjust the number of columns as needed
                crossAxisSpacing: 12, // Adjust the spacing between columns
                mainAxisSpacing: 8, // Adjust the spacing between rows
                childAspectRatio: 1, // Adjust the aspect ratio of the items
              ),
              itemCount: getFilteredProducts().length,
              itemBuilder: (context, index) {
                final product = getFilteredProducts()[index];
                return GridTile(
                  child: Card(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Image.asset(
                            product.imageUrl,
                            height: 300, // Adjust the height of the image
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 4),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

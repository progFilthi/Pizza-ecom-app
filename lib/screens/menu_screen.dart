import 'package:flutter/material.dart';
import '../models/cart_model.dart';
import '../models/products.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});
  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushReplacementNamed(context, '/'),
        ),
        title: const Text(
          'Menu',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 5,
        itemBuilder: (context, i) {
          final product = products[i % products.length];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFF9CBA5),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF9CBA5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Image.asset(
                    product['image'] as String,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product['name'] as String,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        ' 24 24${(product['price'] as double).toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFD0A484),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            cart.add(product);
                            setState(() {});
                          },
                          child: const Text('Add to cart'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFD0A484),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              foregroundColor: Colors.white,
            ),
            onPressed: () => Navigator.pushNamed(context, '/cart'),
            child: const Text('View Cart'),
          ),
        ),
      ),
    );
  }
}

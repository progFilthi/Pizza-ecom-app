import 'package:flutter/material.dart';
import '../models/cart_model.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});
  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int _selected = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Checkout',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              'Payment Method',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 24),
            RadioListTile<int>(
              value: 0,
              groupValue: _selected,
              onChanged: (v) => setState(() => _selected = v!),
              activeColor: const Color(0xFFD0A484),
              title: const Text('Credit card', style: TextStyle(fontSize: 20)),
            ),
            RadioListTile<int>(
              value: 1,
              groupValue: _selected,
              onChanged: (v) => setState(() => _selected = v!),
              activeColor: const Color(0xFFD0A484),
              title: const Text('Visa', style: TextStyle(fontSize: 20)),
            ),
            const Spacer(),
            SizedBox(
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
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Payment Successful'),
                      content: const Text('Thank you for your order!'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            cart.items.clear();
                            Navigator.popUntil(
                              context,
                              ModalRoute.withName('/menu'),
                            );
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text('Pay Now'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

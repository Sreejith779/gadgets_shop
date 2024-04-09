import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600
        ),),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}

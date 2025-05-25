import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_model.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(cart.items[index].name),
                );
              },
            ),
          ),
          Text('Total Price: \$${cart.totalPrice}'),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              cart.removeAll();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Cart cleared')),
              );
            },
            child: const Text('Clear Cart'),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

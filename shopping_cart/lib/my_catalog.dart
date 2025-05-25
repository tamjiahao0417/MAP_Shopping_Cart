import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_model.dart';
import 'item.dart';
import 'my_cart.dart';

class MyCatalog extends StatelessWidget {
  const MyCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(20, (index) => Item('Item $index'));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyCart()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return MyListItem(item: items[index]);
        },
      ),
    );
  }
}

class MyListItem extends StatelessWidget {
  final Item item;
  const MyListItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartModel>();
    bool isInCart = cart.items.contains(item);

    return ListTile(
      title: Text(item.name),
      trailing: isInCart
          ? const Icon(Icons.check, color: Colors.green)
          : TextButton(
              onPressed: () {
                cart.add(item);
              },
              child: const Text('ADD'),
            ),
    );
  }
}

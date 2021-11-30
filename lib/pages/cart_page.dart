import 'package:flutter/material.dart';
import 'package:shopping_cart/album.dart';

class CartPage extends StatefulWidget {
  final List<Album> cart;

  const CartPage({Key? key, required this.cart}) : super(key: key);

  @override
  State<CartPage> createState() => _MyCartPageState(cart);
}

class _MyCartPageState extends State<CartPage> {
  final List<Album> cart;

  _MyCartPageState(this.cart);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          var item = cart[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
            child: Card(
              elevation: 4.0,
              child: ListTile(
                leading: const Icon(
                  Icons.album_outlined,
                  color: Colors.black,
                ),
                title: Text("${item.name} - ${item.author}"),
                trailing: GestureDetector(
                  child: const Icon(
                    Icons.remove_circle,
                    color: Colors.red,
                  ),
                  onTap: () => removeItemsFromCart(item),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void removeItemsFromCart(Album item) {
    setState(() => cart.remove(item));
  }
}

import 'package:flutter/material.dart';
import 'package:shopping_cart/models/album.dart';

class CartIcon extends StatefulWidget {
  final List<Album> cartList;
  final List<Album> albums;

  const CartIcon({Key? key, required this.cartList, required this.albums}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CartIconState(cartList, albums);
}

class _CartIconState extends State<CartIcon> {
  final List<Album> cartList;
  final List<Album> albums;

  _CartIconState(this.cartList, this.albums);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        const Icon(
          Icons.shopping_cart,
          size: 36.0,
        ),
        if (cartList.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 2.0),
            child: CircleAvatar(
              radius: 8.0,
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              child: Text(
                cartList.length.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
              ),
            ),
          )
      ],
    );
  }
}

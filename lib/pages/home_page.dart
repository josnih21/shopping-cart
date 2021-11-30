import 'package:flutter/material.dart';
import 'package:shopping_cart/album.dart';
import 'package:shopping_cart/widgets/albums_grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Album> _albums;
  final List<Album> _cartList = <Album>[];

  @override
  void initState() {
    super.initState();
    _albums = Album.generateAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return AlbumsGrid(
      albums: _albums,
      cartList: _cartList,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shopping_cart/models/album.dart';
import 'package:shopping_cart/pages/cart_page.dart';
import 'package:shopping_cart/widgets/cart_icon.dart';

class AlbumsGrid extends StatefulWidget {
  final List<Album> albums;
  final List<Album> cartList;

  const AlbumsGrid({Key? key, required this.albums, required this.cartList}) : super(key: key);
  @override
  _AlbumsGridState createState() => _AlbumsGridState(albums, cartList);
}

class _AlbumsGridState extends State<AlbumsGrid> {
  final List<Album> albums;
  final List<Album> cartList;

  _AlbumsGridState(this.albums, this.cartList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(context), body: buildGridView(context));
  }

  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      actions: [
        GestureDetector(
          child: Padding(
            padding: const EdgeInsets.only(right: 16, top: 8),
            child: CartIcon(
              cartList: cartList,
              albums: albums,
            ),
          ),
          onTap: () => {
            if (cartList.isNotEmpty)
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartPage(cart: cartList))).then(
                    (value) => setState(
                      () {
                        Navigator.popUntil(context, (route) => route.isFirst);
                        buildGridView(context);
                      },
                    ),
                  )
          },
        ),
      ],
    );
  }

  Widget buildGridView(BuildContext context) {
    return GridView.builder(
      itemCount: albums.length,
      padding: const EdgeInsets.all(4.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        var album = albums[index];
        return Card(
          elevation: 4.0,
          child: Stack(
            fit: StackFit.loose,
            alignment: Alignment.center,
            children: <Widget>[
              cardContent(album),
              productButton(album),
            ],
          ),
        );
      },
    );
  }

  Widget cardContent(Album album) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.network(
          album.image,
          height: 150,
          width: 150,
        ),
        Text(
          album.name,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Text(
          album.author,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.subtitle1,
        )
      ],
    );
  }

  Widget productButton(Album album) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 8.0,
        bottom: 8.0,
      ),
      child: Align(
        alignment: Alignment.bottomRight,
        child: GestureDetector(
          child: (!cartList.contains(album))
              ? const Icon(
                  Icons.add_circle,
                  color: Colors.green,
                )
              : const Icon(
                  Icons.remove_circle,
                  color: Colors.red,
                ),
          onTap: () => manageCart(album),
        ),
      ),
    );
  }

  void manageCart(Album item) {
    setState(() => cartList.contains(item) ? cartList.remove(item) : cartList.add(item));
  }

  void goBack() {
    (value) => setState(() {
          Navigator.popUntil(context, (route) => route.isFirst);
          buildGridView(context);
        });
  }
}

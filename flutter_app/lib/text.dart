import 'package:flutter/material.dart';

class Product {
  const Product({this.name});

  final String name;
}

class ShoppingList extends StatefulWidget {
  ShoppingList({Key key, this.products}) : super(key: key);

  final List<Product> products;

  // The framework calls createState the first time a widget appears at a given
  // location in the tree. If the parent rebuilds and uses the same type of
  // widget (with the same key), the framework re-uses the State object
  // instead of creating a new State object.

  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  Set<Product> _shoppingCart = Set<Product>();

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      // When a user changes what's in the cart, you need to change
      // _shoppingCart inside a setState call to trigger a rebuild.
      // The framework then calls build, below,
      // which updates the visual appearance of the app.

      if (!inCart)
        _shoppingCart.add(product);
      else
        _shoppingCart.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Shopping List'),
        ),
        body: Center(child: _buildStack()));
  }
}

Widget _buildCard() {
  return SizedBox(
    height: 210.0,
    child: Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.restaurant_menu,
              color: Colors.lightBlue,
            ),
            title: Text(
              'Jack Green',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text('Jiangsu Province'),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.account_circle,
              color: Colors.lightBlue,
            ),
            title: Text(
              'Jack Green',
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.account_circle,
              color: Colors.lightBlue,
            ),
            title: Text(
              'Jack Green',
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    ),
  );
}

Widget _buildStack() {
  return Stack(
    alignment: Alignment(0, 0),
    children: <Widget>[Flexible(),Expanded(child: null),
      Image.asset('images/ad.jpeg'
      ),
      Container(
        color: Colors.black54,height: 100,width: 100,
        child: Text(
          "'It's ad",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      )
    ],
  );
}

void main() {
  runApp(MaterialApp(
    title: 'Shopping App',
    home: ShoppingList(
      products: <Product>[
        Product(name: 'Eggs'),
        Product(name: 'Flour'),
        Product(name: 'Chocolate chips'),
      ],
    ),
  ));
}

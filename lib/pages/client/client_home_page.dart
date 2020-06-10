import 'package:ammar/models/product.dart';
import 'package:ammar/pages/client/cart_page.dart';
import 'package:ammar/pages/client/my_orders_page.dart';
import 'package:ammar/widgets/client/product_widget.dart';
import 'package:flutter/material.dart';

class ClientHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => CartPage()));
            },
            tooltip: 'Cart',
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.grey,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => MyOrdersPage()));
            },
            tooltip: 'My Orders',
            icon: Icon(
              Icons.favorite_border,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Categories',
                style: TextStyle(fontSize: 24),
              ),
              Container(
                height: 64,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 22,
                  separatorBuilder: (_, __) {
                    return SizedBox(width: 16);
                  },
                  itemBuilder: (context, index) {
                    return Text('xx');
                  },
                ),
              ),
              Text(
                'Featured',
                style: TextStyle(fontSize: 24),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: 33,
                itemBuilder: (context, index) {
                  return ProductWidget(
                    product: Product(
                      userId: 1,
                      name: 'Woman T-Shirt',
                      price: 29.99,
                      description: 'asdasdf',
                      category: 'Women',
                      image: null,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

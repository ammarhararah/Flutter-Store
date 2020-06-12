import 'package:ammar/models/category.dart';
import 'package:ammar/pages/client/cart_page.dart';
import 'package:ammar/pages/client/my_orders_page.dart';
import 'package:ammar/state/client_provider.dart';
import 'package:ammar/state/merchant_provider.dart';
import 'package:ammar/widgets/client/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClientHomePage extends StatefulWidget {
  @override
  _ClientHomePageState createState() => _ClientHomePageState();
}

class _ClientHomePageState extends State<ClientHomePage> {
  final categories = [
    Category(
      name: 'Women',
      color: Colors.blue,
      imagePath: '',
    ),
    Category(
      name: 'Men',
      color: Colors.red,
      imagePath: '',
    ),
    Category(
      name: 'Kids',
      color: Colors.green,
      imagePath: '',
    ),
  ];

  @override
  void initState() {
    super.initState();
    Provider.of<MerchantProvider>(context, listen: false).getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
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
              Positioned(
                right: 8,
                top: 8,
                child: Consumer<ClientProvider>(
                  builder: (context, provider, child) {
                    if (provider.cart.isEmpty)
                      return Container();
                    else
                      return Text(
                        provider.cart.length.toString(),
                        style: TextStyle(color: Colors.red),
                      );
                  },
                ),
              ),
            ],
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
      body: Consumer<MerchantProvider>(builder: (context, provider, child) {
        return SingleChildScrollView(
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
                    itemCount: categories.length,
                    separatorBuilder: (_, __) {
                      return SizedBox(width: 16);
                    },
                    itemBuilder: (context, index) {
                      return Card(
                        color: categories[index].color,
                        child: Container(
                          margin: const EdgeInsets.all(16),
                          alignment: Alignment.center,
                          child: Text(
                            categories[index].name,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Text(
                  'Featured',
                  style: TextStyle(fontSize: 24),
                ),
                if (provider.products.isEmpty)
                  Center(
                    child: Text('No Products to Show'),
                  )
                else
                  GridView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                        vertical: 32, horizontal: 16),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: provider.products.length,
                    itemBuilder: (context, index) {
                      return ProductWidget(
                        product: provider.products[index],
                      );
                    },
                  ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import '../providers/product.dart';
import '../widgets/user_item.dart';
import '../widgets/app_drawer.dart';
import '../screens/edit_product_screen.dart';
class UsersProductsScreen extends StatelessWidget {
  static const routeName = '/user-products';

  Future<void> _refreshProducts(BuildContext context) async{
    await Provider.of<Products>(context).fetchAndSetProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).pushNamed(
                EditProductScreen.routeName);
          },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () => _refreshProducts(context),
        child: Padding(padding: EdgeInsets.all(8),
          child: ListView.builder(
              itemCount:productsData.items.length,
              itemBuilder: ((_,i) => Column(
                children: <Widget>[
                  UsersProductItem(
                    productsData.items[i].id,
                    productsData.items[i].title,
                      productsData.items[i].imageUrl),
                  Divider(),
                ],

              )),
        ),
        ),
      ),
    );
  }
}

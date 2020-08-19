import 'package:flutter/material.dart';
import 'package:myshop/screens/bot_screen.dart';
import './screens/cart_screeen.dart';
import 'package:provider/provider.dart';
import './providers/cart.dart';
import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './providers/product.dart';
import './providers/orders.dart';
import './screens/orders_screen.dart';
import './screens/users_screen.dart';
import './screens/edit_product_screen.dart';
import './screens/sign_in_screen.dart';
import './screens/auth_screen.dart';
import './providers/auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
//         ChangeNotifierProxyProvider<Auth,Products>(
// builder: (context, value, previous) => Products(
//   auth.token,
//   previousProducts = null ? []:previousProducts.items;
// ),
//         ),
        
      ChangeNotifierProvider(
        create: (ctx)=>Cart(),
      ),
      ChangeNotifierProvider(
        create:(ctx)=> Orders(),
      ),
    ],
      child: Consumer<Auth>(builder: (ctx,auth,_)=>
        MaterialApp(
        title: 'My Shop',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
          accentColor: Colors.redAccent,
        ),
        home: BotScreen(),
      // routes: {
      //     ProductDetailScreen.routeName:(ctx) => ProductDetailScreen(),
      //     CartScreen.routeName:(ctx) => CartScreen(),
      //     OrdersScreen.routeName:(ctx) => OrdersScreen(),
      //     UsersProductsScreen.routeName:(ctx) => UsersProductsScreen(),
      //     EditProductScreen.routeName:(ctx) => EditProductScreen(),
      //     SigninScreen.routeName:(ctx) => SigninScreen(),


      // },
      ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
    ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

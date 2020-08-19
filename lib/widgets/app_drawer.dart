import 'package:flutter/material.dart';
import 'package:myshop/screens/bot_screen.dart';
import 'package:myshop/screens/sign_in_screen.dart';
import '../screens/orders_screen.dart';
import '../screens/users_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Hello'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Shop'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Orders'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(OrdersScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Manage Products'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(UsersProductsScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.person_add),
            title: Text('Sign In'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(SigninScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings_input_antenna),
            title: Text('Assistance'),
            onTap: () {
              Navigator.of(context)
              .pushReplacementNamed(BotScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}

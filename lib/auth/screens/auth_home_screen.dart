import 'package:flutter/material.dart';
import 'package:hack_infor/auth/provider/auth.dart';
import 'package:hack_infor/auth/screens/auth_screen.dart';
import 'package:hack_infor/screens/home_screen.dart';
import 'package:provider/provider.dart';

class AuthHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of(context);
    return FutureBuilder(
      future: auth.tryAutoLogin(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.error != null) {
          return Center(child: Text('Ocorreu um erro inesperado!2'));
        } else {
          return auth.isAuth ? HomeScreen() : AuthScreeen();
        }
      },
    );
  }
}

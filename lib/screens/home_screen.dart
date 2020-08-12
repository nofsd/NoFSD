import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hack_infor/auth/firebase/firebase_service.dart';
import 'package:hack_infor/widgets/app_drawer.dart';

enum FilterOptions {
  Login,
  Logout,
}

class HomeScreen extends StatelessWidget {
  FirebaseService firebaseService = FirebaseService();
  Future<FirebaseUser> future = FirebaseAuth.instance.currentUser();
  //FirebaseService fS = FirebaseService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Gestão de Equipamentos',
        ),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.account_circle),
            onSelected: (FilterOptions selectetdValue) {},
            itemBuilder: (_) => [
              PopupMenuItem(
                child: RaisedButton(
                  onPressed: () {
                    firebaseService.handleSignIn();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text('Entrar  '), Icon(Icons.input)],
                  ),
                ),
                value: FilterOptions.Login,
              ),
              PopupMenuItem(
                child: RaisedButton(
                  onPressed: () => firebaseService.logout(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text('Sair'), Icon(Icons.call_missed_outgoing)],
                  ),
                ),
                value: FilterOptions.Logout,
              ),
            ],
          ),
        ],
      ),
      body: ListView(
        children: [],
      ),
    );
  }
}

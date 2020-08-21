import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hack_infor/auth/firebase/firebase_service.dart';
import 'package:hack_infor/provider/mobiles_provider.dart';
import 'package:hack_infor/utils/app_rotas.dart';
import 'package:hack_infor/widgets/app_drawer_widget.dart';
import 'package:hack_infor/widgets/mobile_grid_widget.dart';
import 'package:provider/provider.dart';

enum FilterOptions {
  Login,
  Logout,
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = true;

  FirebaseService firebaseService = FirebaseService();
  Future<FirebaseUser> future = FirebaseAuth.instance.currentUser();
  void initState() {
    super.initState();
    Provider.of<MobilesProvider>(context, listen: false)
        .loadMobiles()
        .then((value) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Ativo Fixo',
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRotas.GERENCIAR_MOBILES);
            },
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRotas.MOBILE_FORM);
            },
          ),
        ],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : MobileGridWidget(),
    );
  }
}

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
  final _form = GlobalKey<FormState>();

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
          : Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/fundo_tec_azul.jpg"),
                    fit: BoxFit.cover),
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.white60,
                          Colors.white70,
                        ],
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(50),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  height: 50,
                                  child: Form(
                                    key: _form,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        labelText: 'Busca Dispositivo',
                                        helperStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(7.0),
                                          ),
                                          //borderSide: BorderSide(
                                          //    width: 3,
                                          //    color: Colors.amberAccent),
                                        ),
                                      ),
                                      textInputAction: TextInputAction
                                          .next, // muda para o próximo
                                    ),
                                  ),
                                ),
                              ),
                              Icon(Icons.search)
                            ],
                          ),
                        ),
                        Expanded(
                          child: MobileGridWidget(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

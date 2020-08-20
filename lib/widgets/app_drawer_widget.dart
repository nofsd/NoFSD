import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:hack_infor/auth/firebase/firebase_service.dart';
import 'package:hack_infor/utils/app_rotas.dart';

class AppDrawer extends StatelessWidget {
  get body => null;

  @override
  Widget build(BuildContext context) {
    FirebaseService firebaseService = FirebaseService();
    Future<FirebaseUser> future = FirebaseAuth.instance.currentUser();

    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text(
              'Seja bem vindo! ',
              textAlign: TextAlign.center,
            ),
            automaticallyImplyLeading: false,
            actions: <Widget>[
              new IconButton(
                  icon: new Icon(Icons.home),
                  onPressed: () {
                    firebaseService.logout();
                    Navigator.of(context).pushNamed(AppRotas.AUTH_HOME);
                  })
            ],

            //floatingActionButton: FloatingActionButton(onPressed: () {
            //  Navigator.pop(context);
            //}),
            //leading: Icon(Icons.computer),
          ),
          RaisedButton(
            onPressed: () {
              firebaseService.logout();
              Navigator.of(context).pushNamed(AppRotas.AUTH_HOME);
            },
            child: Icon(Icons.home),
          ),
          Divider(),
          Image.asset(
            "assets/images/logo_nome_01.png",
          ),
          Divider(),
          Container(
            height: 75,
            width: 75,
            child: ClipOval(
              child: FutureBuilder(
                future: future,
                builder: (context, sanapshot) {
                  FirebaseUser user = sanapshot.data;
                  return user != null
                      ? Image.network(
                          user.photoUrl,
                          fit: BoxFit.cover,
                        )
                      : Icon(
                          Icons.account_circle,
                          size: 50,
                        );
                },
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          FutureBuilder(
            future: future,
            builder: (context, snapshot) {
              FirebaseUser user = snapshot.data;
              return user != null
                  ? Text(
                      user.displayName,
                      style: TextStyle(color: Colors.grey[700], fontSize: 17),
                    )
                  : Container();
            },
          ),
          FutureBuilder(
            future: future,
            builder: (context, snapshot) {
              FirebaseUser user = snapshot.data;
              return user != null
                  ? Text(
                      user.email,
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    )
                  : Container();
            },
          ),
          FutureBuilder(
            future: future,
            builder: (context, snapshot) {
              FirebaseUser user = snapshot.data;
              return user == null
                  ? GoogleSignInButton(
                      onPressed: () => firebaseService.handleSignIn(),
                      darkMode: true, // default: false
                    )
                  : RaisedButton(
                      onPressed: () {
                        firebaseService.logout();
                        Navigator.of(context).pushNamed(AppRotas.AUTH_HOME);
                      },
                      child: Text('Sair'),
                    );
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              "Adicionar Mobile",
              textAlign: TextAlign.center,
            ),
            trailing: Icon(Icons.computer),
            onTap: () {
              Navigator.of(context).pushNamed(AppRotas.MOBILE_FORM);
            },
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Gerenciar Mobiles'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(AppRotas.GERENCIAR_MOBILES);
            },
          ),
          ListTile(
            title: Text(
              "Chip's",
              textAlign: TextAlign.center,
            ),
            trailing: Icon(Icons.computer),
            onTap: () {
              Navigator.of(context).pushNamed(AppRotas.MOBILE_CHIPS);
            },
          ),
          ListTile(
            title: Text(
              "Usuarios",
              textAlign: TextAlign.center,
            ),
            trailing: Icon(Icons.computer),
            onTap: () {
              Navigator.of(context).pushNamed(AppRotas.MOBILE_USUARIOS);
            },
          ),
          ListTile(
            title: Text(
              "Controle",
              textAlign: TextAlign.center,
            ),
            trailing: Icon(Icons.computer),
            onTap: () {
              Navigator.of(context).pushNamed(AppRotas.MOBILE_CONTROLE);
            },
          ),
        ],
      ),
    );
  }
}

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
          Divider(),
          Container(
            margin: EdgeInsets.only(bottom: 30, top: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black45,
              boxShadow: [
                BoxShadow(
                    blurRadius: 8, color: Colors.black26, offset: Offset(0, 7)),
              ],
            ),
            padding: EdgeInsets.symmetric(
              vertical: 7,
              horizontal: 70,
            ),
            transform: Matrix4.rotationZ(-8 * 3.14 / 180)..translate(-10.0),
            child: Text(
              'NoFSD',
              style: TextStyle(
                  color: Colors.white70,
                  //Theme.of(context).accentTextTheme.headline6.color,
                  fontSize: 45,
                  fontFamily: 'Anton'),
            ),
          ),
          Divider(),
          Container(
            height: 75,
            width: 75,
            child: ClipOval(
              child: Container(
                height: 50,
                width: 50,
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
                            color: Colors.grey[700],
                          );
                  },
                ),
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
                      textAlign: TextAlign.center,
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
                      textAlign: TextAlign.center,
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
          Expanded(
            child: ListView(
              children: [
                Divider(),
                ListTile(
                  title: Text(
                    "Ativo Fixo",
                    //textAlign: TextAlign.center,
                  ),
                  leading: Icon(Icons.home),
                  onTap: () {
                    Navigator.of(context).pushNamed(AppRotas.HOME);
                  },
                ),
                Divider(),
                ListTile(
                  title: Text(
                    "Solicitar",
                    //textAlign: TextAlign.center,
                  ),
                  leading: Icon(Icons.computer),
                  onTap: () {
                    Navigator.of(context).pushNamed(AppRotas.MOBILE_CHIPS);
                  },
                ),
                Divider(),
                ListTile(
                  title: Text(
                    "Devolver",
                    //textAlign: TextAlign.center,
                  ),
                  leading: Icon(Icons.supervised_user_circle),
                  onTap: () {
                    Navigator.of(context).pushNamed(AppRotas.MOBILE_USUARIOS);
                  },
                ),
                Divider(),
                ListTile(
                  title: Text(
                    "Assistência",
                    //textAlign: TextAlign.center,
                  ),
                  leading: Icon(Icons.settings),
                  onTap: () {
                    Navigator.of(context).pushNamed(AppRotas.MOBILE_CONTROLE);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

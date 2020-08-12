import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:hack_infor/auth/firebase/firebase_service.dart';
import 'package:hack_infor/utils/app_rotas.dart';

class AppDrawer extends StatelessWidget {
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
                      onPressed: () => firebaseService.logout(),
                      child: Text('Sair'),
                    );
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              "Equipamentos",
              textAlign: TextAlign.center,
            ),
            trailing: Icon(Icons.computer),
            onTap: () {
              Navigator.of(context).pushNamed(AppRotas.HOME);
            },
          ),
        ],
      ),
    );
  }
}

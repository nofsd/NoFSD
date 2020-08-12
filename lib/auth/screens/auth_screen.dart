import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:hack_infor/auth/firebase/firebase_service.dart';
import 'package:hack_infor/auth/widgets/auth_card.dart';
import 'package:hack_infor/utils/app_rotas.dart';

class AuthScreeen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseService firebaseService = FirebaseService();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.teal,
                  Colors.black12,
                  Colors.teal,
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: 140),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black45,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 8,
                            color: Colors.black26,
                            offset: Offset(0, 7)),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 7,
                      horizontal: 70,
                    ),
                    transform: Matrix4.rotationZ(-8 * pi / 180)
                      ..translate(-10.0),
                    child: Text(
                      'NoFSD',
                      style: TextStyle(
                          color:
                              Theme.of(context).accentTextTheme.headline6.color,
                          fontSize: 45,
                          fontFamily: 'Anton'),
                    ),
                  ),
                  AuthCard(),
                  GoogleSignInButton(
                    onPressed: () async {
                      bool f;
                      firebaseService.handleSignIn();
                      f = await firebaseService.usuario.toString() != null;
                      if (f) {
                        Navigator.of(context).pushNamed(AppRotas.HOME);
                      }
                    },
                    darkMode: true, // default: false
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

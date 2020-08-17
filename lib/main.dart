import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hack_infor/auth/provider/auth.dart';
import 'package:hack_infor/auth/screens/auth_home_screen.dart';
import 'package:hack_infor/provider/mobiles_provider.dart';
import 'package:hack_infor/screens/home_screen.dart';
import 'package:hack_infor/screens/mobile_form_screen.dart';
import 'package:hack_infor/utils/app_rotas.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
  //Firestore.instance.collection('usuarios').document('pontuacao').setData({
  //  "Fagner": "90",
  //  "Lorena": "80",
  //});
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, MobilesProvider>(
          create: (_) => new MobilesProvider(),
          update: (ctx, auth, previousMobiles) => new MobilesProvider(
            auth.token,
            previousMobiles.itemsMobile,
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'HackInfor',
        theme: ThemeData(
          primarySwatch: Colors.teal,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          accentColor: Colors.tealAccent,
          fontFamily: 'Raleway',
          canvasColor: Color.fromRGBO(255, 255, 255, 1), // cor padrão do
          backgroundColor: Colors.teal[50],
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontSize: 25,
                  color: Colors.blueGrey[300],
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Raleway',
                ),
              ),
        ),
        //home: Container(),
        routes: {
          AppRotas.AUTH_HOME: (ctx) => AuthHomeScreen(),
          AppRotas.HOME: (ctx) => HomeScreen(),
          AppRotas.MOBILE_FORM: (ctx) => MobileFormScreen(),
        },
      ),
    );
  }
}

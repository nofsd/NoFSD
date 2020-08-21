import 'package:flutter/material.dart';
import 'package:hack_infor/models/mobile_model.dart';
import 'package:hack_infor/screens/mobile_dadosbem_screen.dart';
import 'package:hack_infor/screens/mobile_historico_screen.dart';
import 'package:hack_infor/screens/mobile_vinculo_screen.dart';

class MobileDetalhesScreen extends StatefulWidget {
  @override
  _MobileDetalhesScreenState createState() => _MobileDetalhesScreenState();
}

class _MobileDetalhesScreenState extends State<MobileDetalhesScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static List<Widget> _widgetOptions = <Widget>[
    MobileDetalhesDadosBem(),
    MobileDetalhesVinculoScreen(),
    MobileDetalhesHistoricoScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final MobileModel mobile =
        ModalRoute.of(context).settings.arguments as MobileModel;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(mobile.usuario),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            title: Text('Dados'),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delete),
            title: Text('Vínculo'),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delete),
            title: Text('Histórico'),
            backgroundColor: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}

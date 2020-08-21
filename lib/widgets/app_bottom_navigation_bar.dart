import 'package:flutter/material.dart';
import 'package:hack_infor/provider/mobiles_provider.dart';
import 'package:hack_infor/utils/app_rotas.dart';
import 'package:provider/provider.dart';

class AppBottomNavigationBar extends StatefulWidget {
  final int selectedIndex;
  AppBottomNavigationBar({this.selectedIndex});
  @override
  _AppBottomNavigationBarState createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        Navigator.of(context).pushNamed(AppRotas.MOBILE_DETALHES);
        _selectedIndex = index;
      } else if (index == 1) {
        Navigator.of(context).pushNamed(AppRotas.MOBILE_DETALHES2);
        _selectedIndex = index;
      } else if (index == 2) {
        Navigator.of(context).pushNamed(AppRotas.HOME);
        _selectedIndex = index;
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    final MobilesProvider mobile = Provider.of<MobilesProvider>(context);
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Dados'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.link),
          title: Text('Vincular'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.find_in_page),
          title: Text('Pesquisar'),
        ),
      ],
      currentIndex:
          widget.selectedIndex == null ? _selectedIndex : widget.selectedIndex,
      selectedItemColor: Colors.tealAccent[800],
      onTap: _onItemTapped,
    );
  }
}

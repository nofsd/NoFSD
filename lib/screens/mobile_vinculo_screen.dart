import 'package:flutter/material.dart';
import 'package:hack_infor/models/mobile_model.dart';
import 'package:hack_infor/models/usuario_previ_model.dart';
import 'package:hack_infor/provider/usuario_previ_provider.dart';
import 'package:hack_infor/widgets/mobile_detalhe_top_widget.dart';

class MobileDetalhesVinculoScreen extends StatefulWidget {
  @override
  _MobileDetalhesVinculoScreenState createState() =>
      _MobileDetalhesVinculoScreenState();
}

class _MobileDetalhesVinculoScreenState
    extends State<MobileDetalhesVinculoScreen> {
  Widget _createSectionContainerFunci(Widget child) {
    return Container(
        width: 350,
        height: 130,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final MobileModel mobile =
        ModalRoute.of(context).settings.arguments as MobileModel;
    List dadosFunci = ['PRV: ${mobile.prv}', '', ''];
    return SingleChildScrollView(
      child: Column(
        children: [
          MobileDetalheTopWidget(),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              'Vincular bem',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'PRV',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Consulta usuario',
              onPressed: () async {
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }
}

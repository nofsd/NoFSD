import 'package:flutter/material.dart';
import 'package:hack_infor/models/mobile_model.dart';
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
      height: 100,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final MobileModel mobile =
        ModalRoute.of(context).settings.arguments as MobileModel;
    List dadosBem = [
      'PRV: ${mobile.prv}',
      'Nome: ${mobile.usuario}',
    ];
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
          _createSectionContainerFunci(
            ListView.builder(
              itemCount: dadosBem.length,
              itemBuilder: (ctx, index) {
                return Card(
                  color: Colors.black54,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(
                      dadosBem[index],
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

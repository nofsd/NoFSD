import 'package:flutter/material.dart';
import 'package:hack_infor/models/mobile_model.dart';
import 'package:hack_infor/widgets/mobile_detalhe_top_widget.dart';

class MobileDetalhesHistoricoScreen extends StatelessWidget {
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
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final MobileModel mobile =
        ModalRoute.of(context).settings.arguments as MobileModel;
    List dadosHistorico = [
      'Data Locacao: ${mobile.dataLocacao}',
      'Data Devolucao: ${mobile.dataDevolucao}',
    ];
    return SingleChildScrollView(
      child: Column(
        children: [
          MobileDetalheTopWidget(),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              'Historico',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          _createSectionContainerFunci(
            ListView.builder(
              itemCount: dadosHistorico.length,
              itemBuilder: (ctx, index) {
                return Card(
                  color: Colors.black54,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(
                      dadosHistorico[index],
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

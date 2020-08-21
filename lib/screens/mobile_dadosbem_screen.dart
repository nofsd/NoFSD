import 'package:flutter/material.dart';
import 'package:hack_infor/models/mobile_model.dart';
import 'package:hack_infor/widgets/mobile_detalhe_top_widget.dart';

class MobileDetalhesDadosBem extends StatelessWidget {
  Widget _createSectionContainerMobile(Widget child) {
    return Container(
        width: 350,
        height: 300,
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
    List dadosMobile = [
      'DDD: ${mobile.ddd}',
      'Numero: ${mobile.numero}',
      'Imei: ${mobile.imei}',
      'Marca: ${mobile.marca}',
      'Modelo: ${mobile.modelo}',
      'Operadora: ${mobile.operadora}',
      'Marca: ${mobile.pin}',
    ];
    return SingleChildScrollView(
      child: Column(
        children: [
          MobileDetalheTopWidget(),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              'Dados do bem',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          _createSectionContainerMobile(
            ListView.builder(
              itemCount: dadosMobile.length,
              itemBuilder: (ctx, index) {
                return Card(
                  color: Colors.black54,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(
                      dadosMobile[index],
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

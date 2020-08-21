import 'package:flutter/material.dart';
import 'package:hack_infor/models/mobile_model.dart';
import 'package:hack_infor/widgets/app_bottom_navigation_bar.dart';
import 'package:hack_infor/widgets/mobile_detalhe_top_widget.dart';

class MobileDetalhesScreen2 extends StatelessWidget {
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

  Widget _createSectionContainerMobile(Widget child) {
    return Container(
        width: 350,
        height: 190,
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
    List dadosMobile = [
      'DDD: ${mobile.ddd}',
      'Numero: ${mobile.numero}',
      'Imei: ${mobile.imei}',
      'Marca: ${mobile.marca}',
      'Modelo: ${mobile.modelo}',
      'Operadora: ${mobile.operadora}',
      'Marca: ${mobile.marca}',
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(mobile.usuario),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MobileDetalheTopWidget(),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                'Dados Funcionário',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            _createSectionContainerFunci(
              ListView.builder(
                itemCount: dadosFunci.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Colors.black54,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(
                        dadosFunci[index],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                'Dados Mobile',
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
      ),
      bottomNavigationBar: AppBottomNavigationBar(),
    );
  }
}

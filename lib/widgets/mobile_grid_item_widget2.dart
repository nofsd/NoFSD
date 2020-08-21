import 'package:flutter/material.dart';
import 'package:hack_infor/models/mobile_model.dart';
import 'package:hack_infor/utils/app_rotas.dart';
import 'package:provider/provider.dart';

class MobileGridItemWidget2 extends StatelessWidget {
  final String titulo;
  Color cor1 = Colors.grey[900].withOpacity(0.5);
  Color cor2 = Colors.blueGrey.withOpacity(0.5);
  //final Icon icone = Icon(
  //  Icons.mobile_friendly,
  //  size: 20,
  //);
  final Function onPressed = () {};
  Color corIcone;
  Icon icon;

  MobileGridItemWidget2({
    this.titulo,
    //this.cor1,
    //this.cor2,
    //this.icone,
    //this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final MobileModel mobile = Provider.of<MobileModel>(context, listen: false);

    final int status = mobile.status;

    if (status == null) {
      corIcone = Colors.white;
    }
    if (status == 1) {
      corIcone = Colors.tealAccent;
      cor1 = Colors.teal[900].withOpacity(0.5);
      cor2 = Colors.tealAccent.withOpacity(0.5);
    }
    if (status == 2) {
      corIcone = Colors.redAccent;
      cor1 = Colors.red[900].withOpacity(0.5);
      cor2 = Colors.redAccent.withOpacity(0.5);
    }
    if (status == 3) {
      corIcone = Colors.orangeAccent;
      cor1 = Colors.orange[900].withOpacity(0.5);
      cor2 = Colors.orangeAccent.withOpacity(0.5);
    }

    final String tipo = mobile.tradeIn;

    if (tipo == null) {
      icon = Icon(
        Icons.smartphone,
        size: 20,
        color: corIcone,
      );
    }
    if (tipo == '1') {
      icon = Icon(
        Icons.camera_roll,
        size: 20,
        color: corIcone,
      );
    }
    if (tipo == '2') {
      icon = Icon(
        Icons.smartphone,
        size: 20,
        color: corIcone,
      );
    }
    if (tipo == '3') {
      icon = Icon(
        Icons.stay_current_landscape,
        size: 20,
        color: corIcone,
      );
    }
    if (tipo == '4') {
      icon = Icon(
        Icons.computer,
        size: 20,
        color: corIcone,
      );
    }

    return Consumer<MobileModel>(
      builder: (ctx, mobile, _) => Material(
        color: Colors.white70,
        elevation: 10,
        borderRadius: BorderRadius.circular(51),
        child: Container(
          width: 200,
          height: 200,
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                AppRotas.MOBILE_DETALHES,
                arguments: mobile,
              );
            },
            borderRadius: BorderRadius.circular(70),
            splashColor: Theme.of(context).primaryColor,
            child: Container(
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: LinearGradient(
                  colors: [
                    cor1,
                    cor2,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [
                      cor1,
                      cor2,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Card(
                  color: Colors.grey[600],
                  child: Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: icon),
                      Text(
                        mobile.prv,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

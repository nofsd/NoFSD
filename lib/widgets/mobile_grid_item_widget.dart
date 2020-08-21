import 'package:flutter/material.dart';
import 'package:hack_infor/models/mobile_model.dart';
import 'package:hack_infor/utils/app_rotas.dart';
import 'package:provider/provider.dart';

class MobileGridItemWidget extends StatelessWidget {
  Color corIcone;
  @override
  Widget build(BuildContext context) {
    final MobileModel mobile = Provider.of<MobileModel>(context, listen: false);

    final int status = mobile.status;
    if (status == null) {
      corIcone = Colors.white;
    }
    if (status == 1) {
      corIcone = Colors.tealAccent;
    }
    if (status == 2) {
      corIcone = Colors.redAccent;
    }
    if (status == 3) {
      corIcone = Colors.amberAccent;
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              AppRotas.MOBILE_DETALHES,
              arguments: mobile,
            );
          },
          child: Stack(
            children: [
              Image.asset(
                'assets/images/escuro.jpg',
                fit: BoxFit.cover,
              ),
              Column(
                children: [
                  Center(
                    child: Text(
                      mobile.prv,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        footer: Column(
          children: [
            GridTileBar(
              backgroundColor: Colors.black87,
              title: Consumer<MobileModel>(
                // consumer substitui o provider.of
                builder: (ctx, mobile, _) => IconButton(
                  icon: Icon(
                    Icons.phone_android,
                    size: 15,
                  ),
                  color: corIcone,
                  onPressed: () {},
                ),
              ),
              //title: Text(
              //  mobile.prv,
              //  textAlign: TextAlign.center,
              //),
            ),
          ],
        ),
      ),
    );
  }
}

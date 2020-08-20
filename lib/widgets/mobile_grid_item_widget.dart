import 'package:flutter/material.dart';
import 'package:hack_infor/models/mobile_model.dart';
import 'package:hack_infor/utils/app_rotas.dart';
import 'package:provider/provider.dart';

class MobileGridItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MobileModel mobile = Provider.of<MobileModel>(context, listen: false);
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
          child: Image.asset(
            'assets/images/chip_iphone.jpg',
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<MobileModel>(
            // consumer substitui o provider.of
            builder: (ctx, mobile, _) => IconButton(
              icon: Icon(
                Icons.phone_android,
              ),
              color: Theme.of(context).accentColor,
              onPressed: () {},
            ),
          ),
          title: Text(
            mobile.prv,
            textAlign: TextAlign.center,
          ),
          trailing: Consumer<MobileModel>(
            // consumer substitui o provider.of
            builder: (ctx, mobile, _) => IconButton(
              icon: Icon(
                Icons.phone_android,
              ),
              color: Theme.of(context).accentColor,
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}

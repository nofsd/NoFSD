import 'package:flutter/material.dart';
import 'package:hack_infor/exceptions/http_exception.dart';
import 'package:hack_infor/models/mobile_model.dart';
import 'package:hack_infor/provider/mobiles_provider.dart';
import 'package:hack_infor/utils/app_rotas.dart';
import 'package:provider/provider.dart';

class MobileManagerItemWidget extends StatelessWidget {
  final MobileModel mobile;
  Color corIcone;
  AssetImage imageIcone;
  MobileManagerItemWidget({this.mobile});

  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold.of(context);
    //final MobileModel ativo = Provider.of<MobileModel>(context, listen: false);
    if (mobile.status == null) {}
    if (mobile.status == 1) {
      corIcone = Colors.tealAccent;
    }
    if (mobile.status == 2) {
      corIcone = Colors.redAccent;
    }
    if (mobile.status == 3) {
      corIcone = Colors.orangeAccent;
    }

    if (mobile.tipo == null) {
      imageIcone = null;
    }
    if (mobile.tipo == 1) {
      imageIcone = AssetImage('assets/images/chip01.png');
    }
    if (mobile.tipo == 2) {
      imageIcone = AssetImage('assets/images/cel01.png');
    }
    if (mobile.tipo == 3) {
      imageIcone = AssetImage('assets/images/ipad01.png');
    }
    if (mobile.tipo == 4) {
      imageIcone = AssetImage('assets/images/equip_comp_01.png');
    }

    return Material(
      color: Colors.white70,
      elevation: 10,
      borderRadius: BorderRadius.circular(51),
      child: Container(
        padding: EdgeInsets.all(10),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: corIcone,
            backgroundImage: imageIcone,
          ),
          title: Text(
            mobile.prv,
            style: TextStyle(fontSize: 25),
          ),
          trailing: Container(
            width: 100,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      AppRotas.MOBILE_FORM,
                      arguments: mobile,
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  color: Theme.of(context).errorColor,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text('Excluir Mobile'),
                        content: Text('Tem certeza?'),
                        actions: [
                          FlatButton(
                            child: Text('Sim'),
                            onPressed: () => Navigator.of(context).pop(true),
                          ),
                          FlatButton(
                            child: Text('Não'),
                            onPressed: () => Navigator.of(context).pop(false),
                          ),
                        ],
                      ),
                    ).then((value) async {
                      if (value) {
                        try {
                          await Provider.of<MobilesProvider>(context,
                                  listen: false)
                              .deleteMobile(mobile.id);
                        } on HttpException catch (error) {
                          scaffold.showSnackBar(
                            SnackBar(
                              content: Text(error.toString()),
                            ),
                          );
                        }
                      }
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

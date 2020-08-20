import 'package:flutter/material.dart';
import 'package:hack_infor/exceptions/http_exception.dart';
import 'package:hack_infor/models/mobile_model.dart';
import 'package:hack_infor/provider/mobiles_provider.dart';
import 'package:hack_infor/utils/app_rotas.dart';
import 'package:provider/provider.dart';

class MobileManagerItemWidget extends StatelessWidget {
  final MobileModel mobile;
  const MobileManagerItemWidget({this.mobile});
  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold.of(context);
    return Material(
      color: Colors.white70,
      elevation: 10,
      borderRadius: BorderRadius.circular(51),
      child: Container(
        padding: EdgeInsets.all(10),
        child: ListTile(
          leading: CircleAvatar(
              //backgroundImage: NetworkImage(mobile),
              ),
          title: Text(mobile.prv),
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

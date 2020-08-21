import 'package:flutter/material.dart';
import 'package:hack_infor/models/mobile_model.dart';

class MobileDetalheTopWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MobileModel mobile =
        ModalRoute.of(context).settings.arguments as MobileModel;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Image.asset(
                  'assets/images/chip_iphone.jpg',
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 10,
                bottom: 20,
                child: Container(
                  width: 300,
                  color: Colors.black54,
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 20,
                  ),
                  child: Text(
                    mobile.usuario,
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                    ),
                    softWrap:
                        true, // caso tenha a necessidade de fazer quebra de linha
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(Icons.phone_android),
                    SizedBox(
                      width: 7,
                    ),
                    Text('(${mobile.ddd})'),
                    Text('${mobile.numero}'),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.memory),
                    SizedBox(
                      width: 7,
                    ),
                    Text('${mobile.pin}'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hack_infor/provider/mobiles_provider.dart';
import 'package:hack_infor/utils/app_rotas.dart';
import 'package:hack_infor/widgets/app_drawer_widget.dart';
import 'package:hack_infor/widgets/mobile_manager_item_widget.dart';
import 'package:provider/provider.dart';

class MobilesManagerScreen extends StatelessWidget {
  Future<void> _refreshMobiles(BuildContext context) {
    return Provider.of<MobilesProvider>(context, listen: false).loadMobiles();
  }

  @override
  Widget build(BuildContext context) {
    final mobilesData = Provider.of<MobilesProvider>(context);
    final mobiles = mobilesData.itemsMobile;
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciar Mobiles'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRotas.MOBILE_FORM);
            },
          )
        ],
      ),
      drawer: AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () => _refreshMobiles(context),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListView.builder(
            itemCount: mobilesData.itemsCount,
            itemBuilder: (ctx, i) => Column(
              children: [
                MobileManagerItemWidget(
                  mobile: mobiles[i],
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hack_infor/provider/mobiles_provider.dart';
import 'package:hack_infor/widgets/mobile_grid_item_widget.dart';
import 'package:provider/provider.dart';

class MobileGridWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MobilesProvider mobiles =
        Provider.of<MobilesProvider>(context, listen: true);
    return GridView.builder(
      itemCount: mobiles.itemsCount,
      itemBuilder: (ctx, idx) => ChangeNotifierProvider.value(
        value: mobiles.itemsMobile[idx],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            color: Colors.white70,
            elevation: 10,
            borderRadius: BorderRadius.circular(51),
            child: Container(
              child: MobileGridItemWidget(),
            ),
          ),
        ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 3 / 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}

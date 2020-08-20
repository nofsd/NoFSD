import 'package:flutter/material.dart';

class MobileDetalhesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Mobile Detalhes"),
      ),
      body: Center(
        child: Container(
          width: 250,
          height: 250,
          color: Colors.amber,
          child: ListView.builder(
            itemCount: 7,
            itemBuilder: (context, index) {},
          ),
        ),
      ),
    );
  }
}

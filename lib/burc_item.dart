// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, unused_local_variable, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_burclar/burc_detay.dart';
import 'package:flutter_burclar/model/burc.dart';

class BurcItem extends StatelessWidget {
  final Burc listelenenBurc;
  const BurcItem({required this.listelenenBurc, super.key});
  @override
  Widget build(BuildContext context) {
    var myTextStyle = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/burcDetay', arguments: listelenenBurc);
            },
            leading: Image.asset(
              "images/" + listelenenBurc.burcKucukResim,
            ),
            title: Text(
              listelenenBurc.burcAdi,
              style: myTextStyle.headlineMedium,
            ),
            subtitle: Text(
              listelenenBurc.burcTarihi,
              style: myTextStyle.bodyMedium,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.pink.shade400,
            ),
          ),
        ),
      ),
    );
  }
}

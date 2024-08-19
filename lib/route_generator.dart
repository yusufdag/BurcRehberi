// ignore_for_file: body_might_complete_normally_nullable, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_burclar/burc_detay.dart';
import 'package:flutter_burclar/burc_listesi.dart';
import 'package:flutter_burclar/model/burc.dart';

class RouteGenerator {
  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => BurcListesi(),
        );
      
      case '/burcDetay':
      final Burc secilen = settings.arguments as Burc;
      return MaterialPageRoute(builder: (context) => BurcDetay(secilenBurc: secilen),);
    }
  }
}

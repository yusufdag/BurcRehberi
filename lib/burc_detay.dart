// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_interpolation_to_compose_strings, unused_import, unused_field, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_burclar/model/burc.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetay extends StatefulWidget {
  final Burc secilenBurc;
  const BurcDetay({required this.secilenBurc, super.key});

  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Color appbarRengi = Colors.transparent;
  late PaletteGenerator _generator;

  @override
  void initState() {
    super.initState();
    print('init state çalıştı');

    //Burc detayı açmak için tıklandığında bild çalışır ve biter build bittikten sonra addPostFrameCallback ile Image rengi tespit edilir ve renk uygulanır. Ardından tekrar build edilir
    WidgetsBinding.instance.addPostFrameCallback((_) => appbarRenginiBul());

    //_generator = PaletteGenerator.fromImageProvider(AssetImage(assetName));
  }

  @override
  Widget build(BuildContext context) {
    print('build çalıştı');
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            backgroundColor: appbarRengi,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                widget.secilenBurc.burcAdi + ' Burcu ve Özellikleri',
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
              background: Image.asset(
                'images/' + widget.secilenBurc.burcBuyukResim,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Text(
                  widget.secilenBurc.burcDetayi,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void appbarRenginiBul() async {
    print('build bitti baskın renk bulunacak');
    _generator = await PaletteGenerator.fromImageProvider(
      AssetImage('images/${widget.secilenBurc.burcBuyukResim}'),
    );
    appbarRengi = _generator.dominantColor!.color;
    print('baskın renk bulundu');
    setState(() {});

    print(appbarRengi);
  }
}

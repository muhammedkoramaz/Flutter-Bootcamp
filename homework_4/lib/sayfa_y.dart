import 'package:flutter/material.dart';
import 'package:homework_4/anasayfa.dart';

class SayfaY extends StatefulWidget {
  const SayfaY({Key? key}) : super(key: key);

  @override
  State<SayfaY> createState() => _SayfaYState();
}
Future<bool> geriTusu(BuildContext context) async {
  Navigator.of(context).popUntil((route) => route.isFirst);
  return false;
}
class _SayfaYState extends State<SayfaY> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => geriTusu(context),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("SAYFA Y"),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Text("ANASAYFAYA DÖNMEK İÇİN GERİ TUŞUNA BAS."),
            ],
          ),
        ),
      ),
    );
  }
}

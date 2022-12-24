import 'package:ekran_tasarimi/alinacaklar.dart';
import 'package:ekran_tasarimi/renkler.dart';
import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text ("Alınacaklar", style: TextStyle(fontFamily:"Exo",fontSize: 30, fontWeight: FontWeight.bold),),
        backgroundColor: anaRenk,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset("images/sepet.png"),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Alinacak(alinacak: "Domates"),
              Alinacak(alinacak: "Salatalık"),
              Alinacak(alinacak: "Sucuk"),
              Alinacak(alinacak: "Makarna"),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30,right: 50,left: 50),
            child: Row(
              children: [
                FloatingActionButton(onPressed: (){},
                  child: Icon(Icons.menu_outlined),
                  elevation: 10,
                ),
                const Spacer(),
                FloatingActionButton(onPressed: (){},
                child: Icon(Icons.add_circle_outlined),
                  elevation: 10,
                ),
              ],
            ),
          ),
        ],

      ),
    );
  }
}

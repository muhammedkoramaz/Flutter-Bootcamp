import 'package:ekran_tasarimi/renkler.dart';
import 'package:flutter/material.dart';

class Alinacak extends StatelessWidget {

  String alinacak;


  Alinacak({required this.alinacak});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30,left: 30,top: 20,bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(alinacak, style: TextStyle(color: renk4,fontFamily: "Exo", fontSize: 40, fontWeight: FontWeight.bold),),
          const Spacer(),
          FloatingActionButton(onPressed: (){},
            child: Icon(Icons.check_circle),
            elevation: 10,
            backgroundColor:renk3 ,
          ),

        ],
      ),
    );
  }
}

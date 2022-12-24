import 'package:flutter/material.dart';
import 'package:homework_4/sayfa_y.dart';

class SayfaX extends StatefulWidget {
  const SayfaX({Key? key}) : super(key: key);

  @override
  State<SayfaX> createState() => _SayfaXState();
}

class _SayfaXState extends State<SayfaX> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SAYFA X"),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SayfaY()));

              },
              child: const Text("Git > Y"),),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:homework_4/sayfa_b.dart';

class SayfaA extends StatefulWidget {
  const SayfaA({Key? key}) : super(key: key);

  @override
  State<SayfaA> createState() => _SayfaAState();
}

class _SayfaAState extends State<SayfaA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SAYFA A"),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SayfaB()));

              },
              child: const Text("Git > B"),),
          ],
        ),
      ),
    );
  }
}

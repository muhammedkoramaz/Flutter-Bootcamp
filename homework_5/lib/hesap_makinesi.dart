import 'package:flutter/material.dart';

class HesapMakinesi extends StatefulWidget {
  const HesapMakinesi({Key? key}) : super(key: key);

  @override
  State<HesapMakinesi> createState() => _HesapMakinesiState();
}

class _HesapMakinesiState extends State<HesapMakinesi> {
  var t1 = TextEditingController();
  var t2 = TextEditingController();
  var dizi = [];
  int toplam = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hesap Makinesi",style: TextStyle(fontSize: 25)),
        centerTitle: true,

      ),
      body: GestureDetector(
        onTap: (){
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 150,bottom: 150),
              child: TextField(
                controller: t1,onTap: (){},
                keyboardType: TextInputType.none,
                showCursor: false,
                decoration: const InputDecoration(border: InputBorder.none),
                enableInteractiveSelection: false,
                style: const TextStyle(color: Colors.white,fontSize: 50),
                textAlign: TextAlign.center,

              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
                  setState(() {
                    t1.text += "7";
                  });
                }, child: const Text("7"),),
                ElevatedButton(onPressed: (){
                  setState(() {
                    t1.text += "8";
                  });
                }, child: const Text("8")),
                ElevatedButton(onPressed: (){
                  setState(() {
                    t1.text += "9";
                  });
                }, child: const Text("9"),),
                ElevatedButton(onPressed: (){
                  t1.text = "";
                }, child: const Text("C"),),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
                  setState(() {
                    t1.text += "4";
                  });
                }, child: const Text("4"),),
                ElevatedButton(onPressed: (){
                  setState(() {
                    t1.text += "5";
                  });
                }, child: const Text("5"),),
                ElevatedButton(onPressed: (){
                  setState(() {
                    t1.text += "6";
                  });
                }, child: const Text("6"),),
                ElevatedButton(onPressed: (){
                  t1.text.endsWith("+") ? t1.text+="" : t1.text += "+";

                }, child: const Text("+"),),
              ],
            ),

            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
                  setState(() {
                    t1.text += "1";
                  });
                }, child: const Text("1"),),
                ElevatedButton(onPressed: (){
                  setState(() {
                    t1.text += "2";
                  });
                }, child: const Text("2"),),
                ElevatedButton(onPressed: (){
                  setState(() {
                    t1.text += "3";
                  });
                }, child: const Text("3"),),
                ElevatedButton(onPressed: (){
                  setState(() {
                   t1.text = t1.text.substring(0,t1.text.length-1);
                  });
                }, child: const Icon(Icons.backspace_outlined),),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 27),
                  child: SizedBox(width: 250,
                    child: ElevatedButton(onPressed: (){
                      t1.text += "0";
                    }, child: const Text("0"),),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: ElevatedButton(onPressed: (){
                    toplam = 0;
                    setState(() {
                      t1.text.endsWith("+")
                          ?
                      t1.text.substring(0,t1.text.length-1)
                          :
                      dizi = t1.text.split("+");
                      for (var element in dizi) {
                        toplam += int.parse(element);
                        t1.text = toplam.toString();
                      }
                    });

                  }, child: const Text("=")),
                )
              ],
            ),
          ],

        ),
      ),
    );
  }
}

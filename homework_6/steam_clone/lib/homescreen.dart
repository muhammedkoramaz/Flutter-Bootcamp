import 'package:flutter/material.dart';
import 'package:steam_clone/constant.dart';
import 'package:simple_shadow/simple_shadow.dart';

import 'games.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Constant c = Constant();
  int selectedIndex = 0;
  int counter = 0;
  Future<List<Games>> GetGames() async {
    var gamesList = <Games>[];
    var g1 = Games(
        id: 1,
        imageFile: "images/witcher1.png",
        oldPrice: 49.99,
        newPrice: 11.99,
        discount: 70);
    var g2 = Games(
        id: 2,
        imageFile: "images/bannerlord.jpg",
        oldPrice: 394.0,
        newPrice: 244.0,
        discount: 30);
    var g3 = Games(
        id: 3,
        imageFile: "images/ac.jpg",
        oldPrice: 60.0,
        newPrice: 30.0,
        discount: 50);
    var g4 = Games(
        id: 4,
        imageFile: "images/rdr2.png",
        oldPrice: 299.00,
        newPrice: 98.67,
        discount: 67);
    var g5 = Games(
        id: 5,
        imageFile: "images/skyrim.png",
        oldPrice: 349.00,
        newPrice: 87.25,
        discount: 75);
    var g6 = Games(
        id: 6,
        imageFile: "images/eldenring.jpg",
        oldPrice: 599.00,
        newPrice: 419.30,
        discount: 30);
    var g7 = Games(
        id: 7,
        imageFile: "images/eldenring.jpg",
        oldPrice: 599.00,
        newPrice: 419.30,
        discount: 30);

    gamesList.add(g1);
    gamesList.add(g2);
    gamesList.add(g3);
    gamesList.add(g4);
    gamesList.add(g5);
    gamesList.add(g6);
    gamesList.add(g7);
    return gamesList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: c.bgColor2,
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: c.appBarColor,
        title: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 5),
                    child: Container(
                      width: 280,
                      height: 40,
                      decoration: BoxDecoration(color: c.searchBarColor),
                      child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 10, right: 0, bottom: 10),
                              child: SizedBox(
                                height: 5,
                                child: Image.asset("images/logo_steam.png"),
                              ),
                            ),
                            suffixIcon: IconButton(
                              icon:
                                  Icon(Icons.search, color: c.appBarTextColor),
                              onPressed: () {
                                /* Clear the search field */
                              },
                            ),
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.more_vert_outlined,
                    color: c.appBarTextColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: SizedBox(
                        height: 36, child: Image.asset("images/aragorn.jpg")),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "MENÜ",
                      style: TextStyle(fontSize: 12, fontFamily: "Proxima"),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 0, bottom: 2),
                      child: Icon(Icons.keyboard_arrow_down_outlined, size: 18),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    const Text(
                      "İSTEK LİSTESİ",
                      style: TextStyle(fontSize: 12, fontFamily: "Proxima"),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    const Text(
                      "CÜZDAN",
                      style: TextStyle(fontSize: 12, fontFamily: "Proxima"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Text(
                        " (53,85 TL)",
                        style: TextStyle(
                            fontSize: 11,
                            fontFamily: "Proxima",
                            color: c.activeColor),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: c.appBarColor,
        ),
        child: BottomNavigationBar(
          unselectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.local_offer), label: ""),
            BottomNavigationBarItem(
              icon: Icon(Icons.newspaper),
              label: "",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.shield), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: ""),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: c.activeColor,
          showUnselectedLabels: false,
          showSelectedLabels: false,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "ARKADAŞLARIN ARASINDA POPÜLER",
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: "Proxima",
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0),
              child: SizedBox(
                height: 130,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(2),
                      child: SizedBox(
                        width: 89.9,
                        height: 130,
                        child: SimpleShadow(
                          opacity: 0.9,
                          color: Colors.black,
                          offset: const Offset(1, 1),
                          sigma: 1,
                          child: Image.asset("images/${index + 1}.png"),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "EN ÇOK SATAN OYUNLAR",
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: "Proxima",
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            FutureBuilder<List<Games>>(
              future: GetGames(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var gamesList = snapshot.data;
                  return GridView.builder(
                    shrinkWrap: true,
                    itemCount: gamesList!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3.1 / 2,
                    ),
                    itemBuilder: (context, indeks) {
                      var game = gamesList[indeks];
                      counter += 1;
                      return GestureDetector(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 5, right: 5, left: 5, bottom: 0),
                              child: SimpleShadow(
                                opacity: 0.4, // Default: 0.5
                                color: c.activeColor, // Default: Black
                                offset:
                                    const Offset(1, 1), // Default: Offset(2, 2)
                                sigma: 1,
                                child:
                                    Image.asset(game.imageFile), // Default: 2
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Card(
                                    shadowColor: c.appBarColor,
                                    shape: const BeveledRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                    ),
                                    color: Colors.lightGreen,
                                    margin: const EdgeInsets.only(
                                        right: 0, left: 5),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "-${game.discount}%",
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontFamily: "Proxima",
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )),
                                Card(
                                  color: Colors.black38,
                                  margin: const EdgeInsets.only(left: 0),
                                  shape: const BeveledRectangleBorder(
                                      borderRadius: BorderRadius.zero),
                                  child: SizedBox(
                                    width: 120,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(7.0),
                                          child: Text(
                                            "${game.oldPrice} TL",
                                            style: const TextStyle(
                                                color: Colors.grey,
                                                fontFamily: "Proxima",
                                                fontSize: 12,
                                                decoration:
                                                    TextDecoration.lineThrough),
                                          ),
                                        ),
                                        Text(
                                          "${game.newPrice} TL",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Proxima"),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return const Center();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

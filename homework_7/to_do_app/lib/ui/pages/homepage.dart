import 'package:flutter/material.dart';
import 'package:to_do_app/data/entity/todos.dart';
import 'package:to_do_app/ui/assets/colors.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/ui/cubit/homepage_cubit.dart';
import 'package:to_do_app/ui/pages/add_page.dart';
import 'package:to_do_app/ui/pages/detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSearch = false;
  bool checked = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomepageCubit>().getTodos();
  }

  @override
  Widget build(BuildContext context) {
    String currentTime = DateFormat('DD MMM y').format(DateTime.now());

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
              height: 160,
              color: mainColor,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    isSearch
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: TextField(
                                  decoration: const InputDecoration(
                                      hintText: "Search Note...",
                                      hintStyle:
                                          TextStyle(color: Colors.white30),
                                      focusColor: Colors.white),
                                  onChanged: (aramaSonucu) {
                                    print("$aramaSonucu");
                                    context
                                        .read<HomepageCubit>()
                                        .searchTask(aramaSonucu);
                                  },
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    isSearch = false;
                                  });
                                },
                                icon: const Icon(Icons.clear),
                                color: Colors.white,
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Good morning",
                                style: TextStyle(
                                  fontFamily: "Futura",
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isSearch = true;
                                      print(isSearch);
                                    });
                                  },
                                  icon: const Icon(Icons.search),
                                  color: Colors.white),
                            ],
                          ),
                    Row(
                      children: const [
                        Text(
                          "Muhammed",
                          style: TextStyle(
                            fontFamily: "Futura",
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "TASK TO DO TODAY  $currentTime",
                          style: const TextStyle(
                            fontFamily: "Futura",
                            color: Colors.white,
                            fontSize: 16,
                            letterSpacing: 3,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: mainColor,
              child: Container(
                padding: EdgeInsets.only(top: 25),
                width: double.infinity,
                height: 616,
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                child: BlocBuilder<HomepageCubit, List<Todos>>(
                  builder: (context, todoList) {
                    if (todoList.isNotEmpty) {
                      return ListView.builder(
                        itemCount: todoList.length,
                        itemBuilder: (context, index) {
                          var todo = todoList[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            DetailPage(todo: todo),
                                      ))
                                  .then((value) => {
                                        context.read<HomepageCubit>().getTodos()
                                      });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Card(
                                child: Row(
                                  children: [
                                    Checkbox(
                                        value: checked,
                                        onChanged: (bool? newValue) {
                                          setState(() {
                                            checked = newValue!;
                                          });
                                        }),
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Text(
                                        todo.task,
                                        style: const TextStyle(
                                            fontFamily: "Futura", fontSize: 17),
                                      ),
                                    ),
                                    const Spacer(),
                                    IconButton(
                                      onPressed: () {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content:
                                                Text("${todo.task} delete?"),
                                            action: SnackBarAction(
                                                label: "Yes",
                                                onPressed: () {
                                                  context
                                                      .read<HomepageCubit>()
                                                      .deleteTask(todo.id);
                                                  print(
                                                      "${todo.task} deleted.");
                                                }),
                                          ),
                                        );
                                      },
                                      icon: const Icon(Icons.delete_outlined),
                                      color: Colors.black54,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return const Center();
                    }
                  },
                ),
              ),
            ),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddPage(),
              )).then((value) => {context.read<HomepageCubit>().getTodos()});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

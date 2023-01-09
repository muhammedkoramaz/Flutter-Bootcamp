import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/ui/cubit/add_cubit.dart';
import 'package:to_do_app/ui/cubit/detail_cubit.dart';
import 'package:to_do_app/ui/cubit/homepage_cubit.dart';
import 'package:to_do_app/ui/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TodoAddCubit()),
        BlocProvider(create: (context) => TodoDetailCubit()),
        BlocProvider(create: (context) => HomepageCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}

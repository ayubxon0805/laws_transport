import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laws_transport/bloc/bloc/check_answer_bloc.dart';

import 'package:laws_transport/service/hive_service/hive3.dart';
import 'package:laws_transport/ui/bottom_navigation_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HiveService.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CheckAnswerBloc(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const Bottomnavigation(),
      ),
    );
  }
}
/// flutter packages pub run build_runner build 
/// /// flutter packages pub run build_runner build --delete-conflicting-outputs

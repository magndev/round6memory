import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:round6/controllers/game_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:round6/pages/home_page.dart';
import 'package:round6/repositories/recordes_repository.dart';
import 'package:round6/tema.dart';

void main() async {
  await Hive.initFlutter();
  runApp(MultiProvider(
    providers: [
      Provider<RecordesRepository>(create: (_) => RecordesRepository()),
      ProxyProvider<RecordesRepository, GameController>(
        update: (_, repo,  __) => GameController(recordesRepository: repo),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Round 6 Memory',
      debugShowCheckedModeBanner: false,
      theme: Round6Theme.theme,
      home: const HomePage(),
    );
  }
}

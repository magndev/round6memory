import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:round6/controllers/game_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:round6/constants.dart';

class GameScore extends StatelessWidget {
  final Modo modo;

  const GameScore({Key? key, required this.modo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<GameController>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(modo == Modo.round6
                ? Icons.my_location
                : Icons.touch_app_rounded),
            const SizedBox(width: 10),
            Observer(builder:(_) => Text(controller.score.toString(), style: const TextStyle(fontSize: 25))),
          ],
        ),
        Image.asset('images/host.png', width: 38, height: 60),
        TextButton(
          child: const Text(
            'Sair',
            style: TextStyle(fontSize: 18),
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}

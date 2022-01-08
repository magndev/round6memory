import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:round6/constants.dart';
import 'package:round6/repositories/recordes_repository.dart';
import 'package:round6/tema.dart';

class RecordesPage extends StatelessWidget {
  final Modo modo;

  const RecordesPage({Key? key, required this.modo}) : super(key: key);

  getModo() {
    return modo == Modo.normal ? 'Normal' : 'Round 6';
  }

  List<Widget> getRecordesList(Map recordes) {
    final List<Widget> widgets = [];

    recordes.forEach((nivel, score) {
      widgets.add(ListTile(
        title: Text('Nivel $nivel'),
        tileColor: Colors.grey[900],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
      ));

      widgets.add(const Divider(color: Colors.transparent));
    });

    if (widgets.isEmpty) {
      widgets.add(
        const Center(
          child: Text('AINDA NÃO RECORDES!'),
        ),
      );
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<RecordesRepository>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recordes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Observer(
          builder: (context) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 36, bottom: 24),
                child: Center(
                  child: Text(
                    'modo ${getModo()}',
                    style:
                        const TextStyle(fontSize: 28, color: Round6Theme.color),
                  ),
                ),
              ),
              ...getRecordesList(modo == Modo.normal
                  ? repository.recordesNormal
                  : repository.recordesRound6),
            ],
          ),
        ),
      ),
    );
  }
}

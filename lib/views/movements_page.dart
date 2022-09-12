import 'package:flutter/material.dart';

class Movements extends StatefulWidget {
  const Movements({Key? key}) : super(key: key);

  @override
  State<Movements> createState() => _MovementsState();
}

class _MovementsState extends State<Movements> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Movimentações"),
      ),
    );
  }
}

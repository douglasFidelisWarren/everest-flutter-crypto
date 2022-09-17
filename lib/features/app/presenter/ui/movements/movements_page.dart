import 'package:flutter/material.dart';

class MovementsPage extends StatefulWidget {
  const MovementsPage({Key? key}) : super(key: key);

  static const route = '/movements';

  @override
  State<MovementsPage> createState() => _MovementsPageState();
}

class _MovementsPageState extends State<MovementsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Movimentações"),
      ),
    );
  }
}

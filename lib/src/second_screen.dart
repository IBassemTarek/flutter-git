import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final dynamic pair;
  const SecondScreen(this.pair, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        child: Center(
          child: Text(
            pair.toString(),
            style: const TextStyle(
              fontSize: 50,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}

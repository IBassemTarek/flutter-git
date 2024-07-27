// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'second_screen.dart';
import 'widgets/drawer.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: const MyDrawer(),
        appBar: AppBar(
          title: const Text('First Flutter App'),
          centerTitle: true,
        ),
        body: _myListView(context),
      ),
    );
  }

  Widget _myListView(context) {
    return ListView(
      children: List.generate(100, (index) {
        return Builder(builder: (context) {
          return ListTile(
            title: Text('Item ${index + 1}'),
            subtitle: const Text('My Flutter App status'),
            leading: const CircleAvatar(
              child: FlutterLogo(
                size: 30,
                textColor: Colors.red,
              ),
            ),
            trailing: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondScreen('Item ${index + 1}'),
                ),
              );
            },
          );
        });
      }),
    );
  }
}

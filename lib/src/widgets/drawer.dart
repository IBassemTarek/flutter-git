import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const SizedBox.square(
            dimension: 18,
          ),
          const SizedBox.square(
            dimension: 100,
            child: FlutterLogo(),
          ),
          ListTile(
            title: const Text('Drawer Menu'),
            onTap: () {
              print('you clicked');
            },
          ),
          Column(
            children: List.generate(6, (index) {
              if (index == 0) {
                return ListTile(
                  title: Text('item ${index + 1}'),
                  onTap: () {
                    print('you clicked');
                  },
                );
              } else
                return ListTile(
                  title: Text('alo ${index + 1}'),
                  onTap: () {
                    print('you clicked');
                  },
                );
            }),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pollearn/pages/started.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TambahKelas(),
    );
  }
}

class TambahKelas extends StatelessWidget {
  const TambahKelas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Material App'),
        ),
        body: Center(
          child: Container(
            child: Text('Hello World'),
          ),
        ),
        bottomNavigationBar: ConvexAppBar(
          backgroundColor: Colors.white,
          style: TabStyle.reactCircle,
          color: Colors.blueGrey,
          activeColor: Colors.blue,
          items: [
            TabItem(icon: Icons.add, title: 'Tambah'),
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.people, title: 'Profile'),
          ],
          initialActiveIndex: 1,
          onTap: (int i) => print('click index=$i'),
        ));
  }
}

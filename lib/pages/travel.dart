import 'package:flutter/material.dart';

class Travel extends StatefulWidget {
  const Travel({Key? key}) : super(key: key);

  @override
  _TravelState createState() => _TravelState();
}

class _TravelState extends State<Travel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('旅行'),
      ),
      body: const Column(children: [Text('旅行')]),
    );
  }
}

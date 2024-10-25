import 'package:flutter/material.dart';

class CountPage extends StatefulWidget {
  const CountPage({super.key});

  @override
  State<CountPage> createState() => _CountPageState();
}

class _CountPageState extends State<CountPage> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text("$count"),
            ElevatedButton(onPressed: () {
              setState(() {
                count++;
              });
            }, child: Icon(Icons.add)),
            ElevatedButton(onPressed: () {
              setState(() {
                count--;
              });
            }, child: Icon(Icons.remove)),
            ElevatedButton(onPressed: () {
              setState(() {
                count = 0;
              });
            }, child: Icon(Icons.refresh))
          ],
        ),
      ),
    );
  }
}

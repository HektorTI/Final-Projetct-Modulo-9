import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _top = 0;
  double _left = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
      ),
      body: Container(
        color: const Color.fromARGB(255, 77, 64, 60),
        child: Stack(
          children: [
            Positioned(
              top: _top,
              left: _left,
              child: GestureDetector(
                onTap: () {
                  // ignore: avoid_print
                  print('TOP = $_top LEFT = $_left');
                },
                onPanUpdate: (details) {
                  setState(() {
                    _top = _top + details.delta.dy;
                    _left = _left + details.delta.dx;
                  });
                  // ignore: avoid_print
                  print('TOP = $_top LEFT = $_left');
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Icon(Icons.access_alarm,
                      color: Colors.blueAccent, size: 200),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

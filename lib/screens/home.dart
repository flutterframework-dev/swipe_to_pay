import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  bool accepted = false;

  final Container start = Container(
    width: 50,
    height: 50,
    color: Colors.blue,
  );

  AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(10.0),
          height: 70,
          color: Colors.grey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Draggable(
                axis: Axis.horizontal,
                feedback: start,
                child: start,
                childWhenDragging: Container(
                  width: 50,
                  height: 50,
                ),
                onDragEnd: (details) {
                  print(details.velocity);
                  print(details.wasAccepted);
                  print(details.offset);
                },
                onDragStarted: () {},
              ),
              DragTarget(
                builder: (context, data, rejectedData) {
                  return Container(
                    width: 50,
                    height: 50,
                    color: Colors.red,
                    child: accepted ? start : Container(),
                  );
                },
                onAccept: (data) {
                  print('ACCEPTED');

                  setState(() {
                    accepted = !accepted;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

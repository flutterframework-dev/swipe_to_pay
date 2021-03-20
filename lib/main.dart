import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import './config/palette.dart' as palette;
import 'package:google_fonts/google_fonts.dart';
import './screens/checkout.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: SwipeToPay(),
    );
  }
}

class SwipeToPay extends StatefulWidget {
  @override
  _SwipeToPayState createState() => _SwipeToPayState();
}

class _SwipeToPayState extends State<SwipeToPay> {
  bool isDragging = false;
  bool initiatePayment = false;

  void setVisibility(bool visible) {
    setState(() {
      isDragging = !visible;
    });
  }

  void setInitiatePayment(bool isPaymentInitiated) {
    setState(() {
      initiatePayment = isPaymentInitiated;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: Checkout()),
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.only(left: 5.0, right: 5.0),
              height: 60,
              decoration: BoxDecoration(
                color: palette.background,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Stack(
                children: [
                  Visibility(
                    visible: initiatePayment ? true : !isDragging,
                    child: Center(
                      child: Text(
                        initiatePayment ? 'PROCESSING...' : 'SWIPE TO PAY',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                  DraggableContainer(
                    setVisibility: setVisibility,
                    setInitiatePayment: setInitiatePayment,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: initiatePayment
                          ? Center(
                              child: SizedBox(
                                height: 18,
                                width: 18,
                                child: CircularProgressIndicator(
                                  strokeWidth: 3,
                                  valueColor: AlwaysStoppedAnimation(
                                      palette.background),
                                ),
                              ),
                            )
                          : Icon(Icons.arrow_right_alt,
                              color: palette.background),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DraggableContainer extends StatefulWidget {
  final Widget child;
  final Function setVisibility;
  final Function setInitiatePayment;
  DraggableContainer({this.child, this.setVisibility, this.setInitiatePayment});

  @override
  _DraggableContainerState createState() => _DraggableContainerState();
}

class _DraggableContainerState extends State<DraggableContainer>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  bool initiatePayment = false;

  Alignment _dragAlignment = Alignment.centerLeft;
  Animation<Alignment> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);

    _controller.addListener(() {
      setState(() {
        _dragAlignment = _animation.value;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _runAnimation(Offset pixelsPerSecond, Size size) {
    if (_dragAlignment.x > 0.4) {
      _animation = _controller.drive(
        AlignmentTween(
          begin: _dragAlignment,
          end: Alignment.centerRight,
        ),
      );

      setState(() {
        initiatePayment = true;
      });

      widget.setInitiatePayment(true);
    } else {
      _animation = _controller.drive(
        AlignmentTween(
          begin: _dragAlignment,
          end: Alignment.centerLeft,
        ),
      );
    }

    final unitsPerSecondX = pixelsPerSecond.dx / size.width;
    final unitsPerSecond = Offset(unitsPerSecondX, 0);
    final unitVelocity = unitsPerSecond.distance;

    const spring = SpringDescription(mass: 30, stiffness: 1, damping: 1);
    final simulation = SpringSimulation(spring, 0, 1, -unitVelocity);
    _controller.animateWith(simulation);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onPanDown: (details) {
        _controller.stop();
      },
      onPanStart: (details) {
        widget.setVisibility(false);
      },
      onPanUpdate: (details) {
        if (initiatePayment) return;

        double _x = details.delta.dx / (size.width / 1);
        _dragAlignment += Alignment(_x, 0);

        if (_dragAlignment.x < -1) {
          setState(() {
            _dragAlignment = Alignment(-1, 0);
          });
        } else if (_dragAlignment.x > 1) {
          setState(() {
            _dragAlignment = Alignment(1, 0);
          });
        } else {
          setState(() {
            _dragAlignment += Alignment(_x, 0);
          });
        }
      },
      onPanEnd: (details) {
        _runAnimation(details.velocity.pixelsPerSecond, size);

        widget.setVisibility(true);
      },
      child: Align(
        alignment: _dragAlignment,
        child: widget.child,
      ),
    );
  }
}

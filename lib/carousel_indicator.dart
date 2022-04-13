library carousel_indicator;

import 'package:flutter/material.dart';

import 'base_painter.dart';

class CarouselIndicator extends StatefulWidget {
  /// width of the indicator
  final double width;

  /// height of the indicator
  final double height;

  /// space between indicators.
  final double space;

  /// count of indicator
  final int? count;

  /// active color
  final Color activeColor;

  /// normal color
  final Color color;

  /// use this to give some radius to the corner indicator
  final double cornerRadius;

  /// duration for slide animation
  final int animationDuration;

  final int? index;

  CarouselIndicator({
    Key? key,
    this.width: 20.0,
    this.height: 6,
    this.space: 5.0,
    this.count,
    this.cornerRadius: 6,
    this.animationDuration: 300,
    this.color: Colors.white30,
    this.index,
    this.activeColor: Colors.white,
  })  : assert(count != null && count != 0),
        assert(index != null && index >= 0),
        super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _CarouselIndicatorState();
  }
}

class _CarouselIndicatorState extends State<CarouselIndicator>
    with TickerProviderStateMixin {
  /// [Tween] object of type double
  late Tween<double> _tween;

  /// [AnimationController] object
  late AnimationController _animationController;

  /// [Aniamtion] object
  late Animation _animation;

  /// [Paint] object to paint our indicator
  Paint _paint = new Paint();

  /// Method to initilize [BasePainter] to paint indicators.
  BasePainter _createPainer() {
    return SlidePainter(widget, _animation.value, _paint);
  }

  @override
  Widget build(BuildContext context) {
    Widget child = new SizedBox(
      width: widget.count! * widget.width + (widget.count! - 1) * widget.space,
      height: widget.height,
      child: CustomPaint(
        painter: _createPainer(),
      ),
    );

    return new IgnorePointer(
      child: child,
    );
  }

  @override
  void initState() {
    /// for initial index=0 we do not want to change any value so setting [_tween] to (0.0,0.0),
    createAnimation(0.0, 0.0);
    super.initState();
  }

  @override
  void didUpdateWidget(CarouselIndicator oldWidget) {
    if (widget.index != oldWidget.index) {
      if (widget.index != 0) {
        _animationController.reset();

        /// for each new index we want to change value so setting [_tween] to (oldWidget.index,widget.index) so animation tween from old position to new position rather not start from 0.0 again and again.
        createAnimation(oldWidget.index!.toDouble(), widget.index!.toDouble());
        _animationController.forward();
      } else {
        _animationController.reset();
        createAnimation(oldWidget.index!.toDouble(), 0.0);
        _animationController.forward();
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void createAnimation(double begin, double end) {
    _tween = Tween(begin: begin, end: end);
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: widget.animationDuration));
    _animation = _tween.animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
  }
}

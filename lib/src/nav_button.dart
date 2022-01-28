import 'package:flutter/material.dart';
import '../curved_navigation_bar.dart' show defaultHeight;

class NavButton extends StatelessWidget {
  final double position;
  final int length;
  final int index;
  final ValueChanged<int> onTap;
  final Widget icon;
  final Widget text;

  NavButton({required this.onTap, required this.position, required this.length, required this.index, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    final desiredPosition = 1.0 / length * index;
    final difference = (position - desiredPosition).abs();
    final verticalAlignment = 1 - length * difference;
    final opacity = length * difference;
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          onTap(index);
        },
        child: Container(
          height: defaultHeight,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Transform.translate(
                offset: Offset(
                    0, difference < 1.0 / length ? verticalAlignment * 40 : 0),
                child: Opacity(
                    opacity: difference < 1.0 / length * 0.99 ? opacity : 1.0,
                    child: icon),
              ),
              Transform.translate(
                offset: Offset(
                    0,
                    difference < 0.05 / length
                        ? (verticalAlignment - 20) * -1 : (verticalAlignment - 20) * -1 ),
                child: text,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';

class ColorPicker extends StatelessWidget {
  const ColorPicker({super.key, required this.outBorder, required this.color});

  final bool outBorder;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border:  outBorder ? Border.all(color: color,width: 2) :null,
      ),
      child: Container(

      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
         shape: BoxShape.circle,
         color: color,
    ),
    ),
    );
  }
}

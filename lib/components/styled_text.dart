import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  StyledText({
    super.key,
    required this.label,
    required this.size,
    this.color,
    this.maxLines,
  });
  final String label;
  final double size;
  Color? color = Colors.black;
  int? maxLines = 1;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        color: color,
        fontSize: size,
      ),
      maxLines: maxLines,
    );
  }
}

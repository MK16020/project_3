import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledText extends StatelessWidget {
  StyledText({
    super.key,
    required this.label,
    required this.size,
    this.color,
    this.maxLines,
    this.fontWeight,
  });
  final String label;
  final double size;
  Color? color = Colors.black;
  int? maxLines = 1;
  FontWeight? fontWeight = FontWeight.normal;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: GoogleFonts.mukta(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.normal,
      ),
      maxLines: maxLines,
    );
  }
}

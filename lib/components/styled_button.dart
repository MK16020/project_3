import 'package:flutter/material.dart';
import 'package:project_3/components/styled_text.dart';

class StyledButton extends StatelessWidget {
  final String label;
  const StyledButton({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xff38b750),
        borderRadius: BorderRadius.all(
          Radius.circular(24),
        ),
      ),
      width: 300,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: StyledText(
            label: label,
            size: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

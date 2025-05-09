import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasicAppButton extends StatelessWidget{
  final VoidCallback onPressed;
  final String title;
  final double ? height;
  final Color ? color;
  final Color ? textColor;
  const BasicAppButton({
    required this.onPressed,
    required this.title,
    this.height,
    this.color,
    this.textColor,
    super.key
});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize:  Size.fromHeight( height ?? 80),
          backgroundColor: color ?? Colors.blue,
          foregroundColor: textColor ?? Colors.white,
        ),
        child: Text(
            title
        ),
    );
  }
}
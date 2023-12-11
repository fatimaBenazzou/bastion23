import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final IconData? icon;
  final Color textColor;
  final Color buttonColor;

  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.icon,
    this.textColor = Colors.white,
    this.buttonColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 24, color: textColor),
            const SizedBox(width: 8), // Espace entre l'icône et le texte
          ],
          Text(
            text,
            style: TextStyle(
              color: textColor,
              // fontSize: 18.0, // Changer la taille du texte selon vos besoins
            ),
          ),
        ],
      ),
    );
  }
}

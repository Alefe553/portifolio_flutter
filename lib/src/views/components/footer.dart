import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});
  static const whiteText = TextStyle(
    fontSize: 12,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[700],
      padding: const EdgeInsets.all(8),
      child: Row(
        children: const [
          Text("COPYRIGHT   ", style: whiteText),
          Icon(Icons.copyright_outlined),
          Text(
            "   CREATED BY ÁLEFE GABRIEL DA SILVA",
            style: whiteText,
          ),
        ],
      ),
    );
  }
}

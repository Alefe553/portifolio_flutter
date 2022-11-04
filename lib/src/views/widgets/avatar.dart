import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String src;
  const Avatar({super.key, required this.src});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: SizedBox(
          child: Image.network(src),
        ),
      ),
    );
  }
}

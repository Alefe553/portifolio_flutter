import 'package:flutter/material.dart';

class CardCustom extends StatelessWidget {
  final String? title;
  final String? subTitle;

  const CardCustom({super.key, this.title, this.subTitle});

  static const TextStyle whiteText = TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  title ?? '',
                  style: whiteText,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Divider(),
            ),
            Expanded(
              child: Center(
                child: Text(
                  subTitle ?? '',
                  style: whiteText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

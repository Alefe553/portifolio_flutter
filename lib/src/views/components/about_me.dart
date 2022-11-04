import 'package:flutter/material.dart';
import '../widgets/card_custom.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  static const String title = 'ABOUT ME';
  static const String description =
      "I AM A DEVELOPER, I HAVE EXPERIENCE WITH VARIOUS TECHNOLOGIES SUCH AS JAVA (FOR ANDROID), FLUTTER, JAVASCRTIP (AND SOME LIBRARIES AND FRAMEWORKS SUCH AS REACT, ANGULAR AND EXPRESS) AND PHP.";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(
        bottom: 40,
        left: 16,
        right: 16,
        top: 32,
      ),
      children: [
        const SizedBox(height: 8),
        Row(
          children: const [
            Expanded(
              flex: 2,
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  description,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: width >= 900 ? 3 : 1,
          crossAxisSpacing: 24,
          childAspectRatio: 2,
          children: const [
            CardCustom(
              title: "LOCATION",
              subTitle: "BRAZIL",
            ),
            CardCustom(
              title: "JOB",
              subTitle: "DEVELOPER",
            ),
            CardCustom(
              title: "EMAIL",
              subTitle: "alefe_08@hotmail.com",
            ),
          ],
        )
      ],
    );
  }
}

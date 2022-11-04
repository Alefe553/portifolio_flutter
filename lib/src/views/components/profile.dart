import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  static const TextStyle textWhite = TextStyle(color: Colors.white);

  static void _lauchLink(String url) async {
    Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text(
        'ÁLEFE GABRIEL DA SILVA',
        style: textWhite,
      ),
      subtitle: const Padding(
        padding: EdgeInsets.only(top: 16),
        child: Text(
          'BACKEND & FRONTEND DEVELOPER',
          style: textWhite,
        ),
      ),
      isThreeLine: true,
      trailing: ElevatedButton.icon(
        icon: const Icon(Icons.link),
        label: const Text('VISIT GITHUB'),
        onPressed: () => _lauchLink('https://github.com/Alefe553'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_testing/widgets/contact/contact_text.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.platformDefault)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(image: DecorationImage(
        image: AssetImage('assets/Me.png'),
        fit: BoxFit.cover,
      )),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isCompact =
              constraints.maxWidth < 340 || constraints.maxHeight < 360;
          final iconSize = isCompact ? 24.0 : 30.0;
          final tileSize = isCompact ? 50.0 : 56.0;
          final itemSpacing = isCompact ? 10.0 : 14.0;
          final horizontalPadding = isCompact ? 18.0 : 32.0;
          final contacts = [
            _ContactAction(
              details: 'Joshua Salcedo',
              iconPath: 'assets/contacts/facebook.png',
              url: 'https://www.facebook.com/ajsalcedo0110/',
            ),
            _ContactAction(
              details: 'joshuasalcedo899@gmail.com',
              iconPath: 'assets/contacts/email.png',
              url: 'mailto:joshuasalcedo899@gmail.com',
            ),
            _ContactAction(
              details: '_|osh.dev',
              iconPath: 'assets/contacts/github.png',
              url: 'https://github.com/joshuasalcedo899-cmyk',
            ),
            _ContactAction(
              details: 'joshua-salcedo-softdev',
              iconPath: 'assets/contacts/linkedin.png',
              url: 'https://www.linkedin.com/in/joshua-salcedo-softdev/',
            ),
            _ContactAction(
              details: '(+63)970 155 8776',
              iconPath: 'assets/contacts/phone-call.png',
              url: 'tel:+639701558776',
            ),
          ];

          return Column(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.fromLTRB(
                      horizontalPadding,
                      0,
                      horizontalPadding,
                      isCompact ? 12.0 : 20.0,
                    ),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      runAlignment: WrapAlignment.center,
                      spacing: itemSpacing,
                      runSpacing: itemSpacing,
                      children: contacts.map((contact) {
                        return TextButton(
                          style: _contactButtonStyle,
                          onPressed: () => _launchUrl(contact.url),
                          child: ContactText(
                            contact.details,
                            contact.iconPath,
                            iconSize: iconSize,
                            tileSize: tileSize,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  static final _contactButtonStyle = TextButton.styleFrom(
    alignment: Alignment.centerLeft,
    minimumSize: const Size(44, 44),
    padding: EdgeInsets.zero,
    tapTargetSize: MaterialTapTargetSize.padded,
  );
}

class _ContactAction {
  const _ContactAction({
    required this.details,
    required this.iconPath,
    required this.url,
  });

  final String details;
  final String iconPath;
  final String url;
}

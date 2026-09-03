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
      color: Color(0xFF5A1414),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isCompact =
              constraints.maxWidth < 340 || constraints.maxHeight < 360;
          final iconSize = isCompact ? 36.0 : 48.0;
          final itemSpacing = isCompact ? 4.0 : 10.0;
          final horizontalPadding = isCompact ? 16.0 : 40.0;

          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: isCompact ? 12.0 : 18.0),
                child: Text(
                  'Contacts',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isCompact ? 20.0 : 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(
                    horizontalPadding,
                    0,
                    horizontalPadding,
                    isCompact ? 12.0 : 20.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        style: _contactButtonStyle,
                        onPressed: () => _launchUrl(
                          'https://www.facebook.com/ajsalcedo0110/',
                        ),
                        child: ContactText(
                          'Joshua Salcedo',
                          'assets/contacts/facebook.png',
                          iconSize: iconSize,
                        ),
                      ),
                      SizedBox(height: itemSpacing),
                      ContactText(
                        'joshuasalcedo899@gmail.com',
                        'assets/contacts/email.png',
                        iconSize: iconSize,
                      ),
                      SizedBox(height: itemSpacing),
                      TextButton(
                        style: _contactButtonStyle,
                        onPressed: () => _launchUrl(
                          'https://github.com/joshuasalcedo899-cmyk',
                        ),
                        child: ContactText(
                          '_|osh.dev',
                          'assets/contacts/github.png',
                          iconSize: iconSize,
                        ),
                      ),
                      SizedBox(height: itemSpacing),
                      TextButton(
                        style: _contactButtonStyle,
                        onPressed: () => _launchUrl(
                          'https://www.linkedin.com/in/joshua-salcedo-softdev/',
                        ),
                        child: ContactText(
                          'joshua-salcedo-softdev',
                          'assets/contacts/linkedin.png',
                          iconSize: iconSize,
                        ),
                      ),
                      SizedBox(height: itemSpacing),
                      ContactText(
                        '(+63)970 155 8776',
                        'assets/contacts/phone-call.png',
                        iconSize: iconSize,
                      ),
                    ],
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
    minimumSize: Size.zero,
    padding: EdgeInsets.zero,
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  );
}

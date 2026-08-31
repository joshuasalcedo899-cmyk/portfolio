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
      alignment: Alignment.center,
      child: Column(
        children: [
          Container(
            height: 80.0,
            alignment: Alignment.center,
            child: Text(
              'Contacts',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: 250.0,
            alignment: Alignment.center,
            child: Expanded(
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () => _launchUrl('https://www.facebook.com/ajsalcedo0110/'),
                        child: ContactText(
                          'Joshua Salcedo',
                          'assets/contacts/facebook-logo.png',
                        ),
                      ),
                      SizedBox(height: 10.0),
                      ContactText(
                        'joshuasalcedo899@gmail.com',
                        'assets/contacts/email.png',
                      ),
                      SizedBox(height: 10.0),
                      ContactText(
                        '(+63)970 155 8776',
                        'assets/contacts/phone-call.png',
                      ),
                      SizedBox(height: 10.0),
                      TextButton(
                      onPressed: () => _launchUrl(
                        'https://github.com/joshuasalcedo899-cmyk',
                      ),
                      child: ContactText(
                        '_|osh.dev',
                        'assets/contacts/github.png',
                      ),
                    ),
                    SizedBox(height: 10.0),
                    TextButton(
                      onPressed: () => _launchUrl('https://www.linkedin.com/in/joshua-salcedo-softdev/'),
                      child: ContactText(
                        'joshua-salcedo-softdev',
                        'assets/contacts/linkedin.png',
                      ),
                    ),
                    SizedBox(height: 10.0),
                    ContactText(
                      '(+63)970 155 8776',
                      'assets/contacts/phone-call.png',
                    ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

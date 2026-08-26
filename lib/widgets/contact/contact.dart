import 'package:flutter/material.dart';
import 'package:flutter_testing/widgets/contact/contact_text.dart';

class Contact extends StatelessWidget {
  final String title;
  const Contact(this.title, {super.key});

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
            height: 150.0,
            alignment: Alignment.center,
            child: Text(
              title,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(color: Colors.white, width: 1.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ContactText('Joshua Salcedo', 'assets/contacts/facebook.png'),
                          SizedBox(height: 50.0),
                          ContactText('joshuasalcedo899@gmail.com', 'assets/contacts/email.png'),
                          SizedBox(height: 50.0),
                          ContactText('+63 917 123 4567', 'assets/contacts/phone-call.png'),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ContactText('_|osh.dev', 'assets/contacts/github.png'),
                          SizedBox(height: 50.0),
                          ContactText('joshua-salcedo-softdev', 'assets/contacts/linkedin.png'),
                          SizedBox(height: 50.0),
                          ContactText('+63 917 123 4567', 'assets/contacts/phone-call.png'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

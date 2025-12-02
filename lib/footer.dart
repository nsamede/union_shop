import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  static const TextStyle footerHeading = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 14,
      letterSpacing: 1,
      height: 2.5);

  static const TextStyle footerBodyText = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      height: 2.5,
      fontSize: 12);

  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        color: Colors.grey.withAlpha(30),
        margin: const EdgeInsets.only(top: 35),
        padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 40),
        child: const Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Opening Hours', style: footerHeading),
                Text("❄️ Winter Break Closure Dates ❄️", style: footerBodyText),
                Text(
                  "Closing 4pm 19/12/2025",
                  style: footerBodyText,
                ),
                Text("Reopening 10am 05/12/2025", style: footerBodyText),
                Text("Last post date: 12pm on 18/12/2025",
                    style: footerBodyText),
                Divider(),
                Text("(Term Time)", style: footerBodyText),
                Text("Monday - Friday 10am - 4pm", style: footerBodyText),
                Text("(Outside of Term Time / Consolidation Weeks)",
                    style: footerBodyText),
                Text("Monday - Friday 10am - 3pm", style: footerBodyText),
                Text("Purchase online 24/7",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        height: 2.5)),
              ],
            ),
          ],
        ));
  }
}

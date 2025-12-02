import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Footer extends StatelessWidget {
  static const TextStyle footerHeading = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 16,
      letterSpacing: 1,
      height: 2.5);

  static const TextStyle footerBodyText = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      height: 2.5,
      fontSize: 12,
      letterSpacing: 1);

  static const TextStyle footerLink = TextStyle(
      color: Colors.black87,
      fontSize: 14,
      height: 3,
      fontWeight: FontWeight.bold);

  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        color: Colors.grey.withAlpha(15),
        margin: const EdgeInsets.only(top: 35),
        padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Opening Hours
            const Column(
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
            // Help and Information
            Container(
              margin: const EdgeInsets.only(top: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Help and Information",
                    style: footerHeading,
                  ),
                  GestureDetector(
                    child: const Text("Search", style: footerLink),
                    onTap: () {},
                  ),
                  GestureDetector(
                    child: const Text("Terms & Conditions of Sale Policy",
                        style: footerLink),
                    onTap: () {},
                  )
                ],
              ),
            ),
            // Latest Offers form
            Container(
              margin: const EdgeInsets.only(top: 40, bottom: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Latest Offers", style: footerHeading),
                  Form(
                    child: Column(
                      children: [
                        TextFormField(
                            decoration: const InputDecoration(
                          label: Text("Email address"),
                          border: OutlineInputBorder(),
                        )),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          width: double.infinity,
                          child: TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.purple.shade900,
                                foregroundColor: Colors.white,
                                shape: const RoundedRectangleBorder()),
                            child: const Padding(
                              padding: EdgeInsets.all(12),
                              child: Text(
                                "SUBSCRIBE",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2),
                              ),
                            ),
                            onPressed: () {},
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            // Icons
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: SvgPicture.asset(
                        "images/facebookLogo.svg",
                        height: 25,
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                        child: SvgPicture.asset(
                          "images/twitterLogo.svg",
                          height: 25,
                        ),
                        onTap: () {}),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      "images/applePayLogo.svg",
                      height: 25,
                    ),
                    SvgPicture.asset(
                      "images/dinersClubLogo.svg",
                      height: 25,
                    ),
                    SvgPicture.asset(
                      "images/discoverLogo.svg",
                      height: 25,
                    ),
                    SvgPicture.asset(
                      "images/googlePayLogo.svg",
                      height: 25,
                    ),
                    SvgPicture.asset(
                      "images/maestroLogo.svg",
                      height: 25,
                    ),
                    SvgPicture.asset(
                      "images/mastercardLogo.svg",
                      height: 25,
                    ),
                    SvgPicture.asset(
                      "images/shopPayLogo.svg",
                      height: 25,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "images/unionPayLogo.svg",
                      height: 25,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    SvgPicture.asset(
                      "images/visaLogo.svg",
                      height: 25,
                    ),
                  ],
                ),
              ],
            ),
            Container(
                margin: const EdgeInsets.only(top: 40),
                child: const Text("© 2025, upsu-store Powered by Shopify"))
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Image.asset(
                "images/upsuLogo.png",
                scale: 1.5,
              ),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Sign in",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    ),
                    Text(
                      "Choose how you'd like to sign in",
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[700],
                          letterSpacing: 1),
                    )
                  ],
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xff5433EB),
                      foregroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(8, 8))),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Sign in with",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                        ),
                        const SizedBox(width: 5),
                        SvgPicture.asset(
                          "images/shopLogo.svg",
                          width: 50,
                        )
                      ],
                    )),
              ),
            ),
            Row(
              children: [
                const Expanded(
                  child: Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text("or", style: TextStyle(color: Colors.grey[700])),
                ),
                const Expanded(child: Divider())
              ],
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                hint: Text(
                  "Email",
                  style: TextStyle(color: Colors.grey),
                ),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xff4d2963),
                  foregroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.elliptical(8, 8))),
                ),
                onPressed: () {},
                child: const Text(
                  "Continue",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

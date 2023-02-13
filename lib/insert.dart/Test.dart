import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 600,
          width: 400,
          child: Card(
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 200,
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset(
                            'images/1.png',
                            scale: 1,
                          )),
                    ),
                  ),
                  Container(
                    width: 250,
                    child: const Text(
                      "How to Use Card in Flutter | Fluter Guide",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 15),
                    width: 250,
                    child: const Text(
                      "Cards in Flutter are a type of Material Design widgets that provide a good look and feel across different platforms.",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

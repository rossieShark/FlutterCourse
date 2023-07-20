import 'package:flutter/material.dart';

import 'package:portico/main.dart';
import 'package:portico/screens/lightroom_screen.dart';

class PhotosScreen extends StatelessWidget {
  final String label;
  final List<String> images;
  const PhotosScreen({super.key, required this.label, required this.images});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          label,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: AppFonts.cormorant.font),
        ),
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.close),
        //     onPressed: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //           builder: (context) => const Portico(),
        //           fullscreenDialog: true,
        //         ),
        //       );
        //     },
        //   ),
        //],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return LightroomScreen(
                              image: images[index],
                            );
                          },
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                          fullscreenDialog: true,
                        ),
                      );
                    },
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset(
                          images[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final double opacity;
  const CustomAppBar({Key? key, this.opacity = 0.8}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Container(
        padding: const EdgeInsets.only(top: 48, left: 16, right: 16),
        child: Row(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "a planet",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                  const TextSpan(text: '\n'),
                  const TextSpan(
                    text: 'we love a planet',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

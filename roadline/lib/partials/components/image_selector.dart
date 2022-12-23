import 'package:flutter/material.dart';
import 'package:roadline/styles/constants.dart';

@immutable
class ImageSelector extends StatefulWidget {
  const ImageSelector({super.key});

  @override
  State<ImageSelector> createState() => _ImageSelectorState();
}

class _ImageSelectorState extends State<ImageSelector> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        child: Stack(
          children: <Widget>[
            Container(
              width: 150.0,
              height: 150.0,
              decoration: const BoxDecoration(
                color: kCardBackgroundColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.panorama,
                size: 75.0,
                color: kCardContentColor,
              ),
            ),
            Positioned(
              right: 0.0,
              bottom: 0.0,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: const BoxDecoration(
                      color: kButtonBackgroundColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.edit,
                      size: kDefaultIconSize - 5.0,
                      color: kCardBackgroundColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

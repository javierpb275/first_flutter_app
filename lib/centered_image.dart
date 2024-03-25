import 'package:flutter/material.dart';

enum ImageType {
  network,
  asset,
}

class CenteredImage extends StatelessWidget {
  final String imageUrl;
  final ImageType imageType;
  final double width;
  final double height;

  const CenteredImage({
    super.key,
    required this.imageUrl,
    required this.imageType,
    this.width = 200,
    this.height = 200,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        height: height,
        child: _buildImageWidget(),
      ),
    );
  }

  Widget _buildImageWidget() {
    switch (imageType) {
      case ImageType.network:
        return Image.network(imageUrl, fit: BoxFit.cover);
      case ImageType.asset:
        return Image.asset(imageUrl, fit: BoxFit.cover);
    }
  }
}

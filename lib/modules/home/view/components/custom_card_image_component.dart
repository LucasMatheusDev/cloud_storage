import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCardGalleryImageComponent extends StatelessWidget {
  /// Image url to show in the card
  final String urlImage;
  final void Function()? onTap;

  /// [tag] for [hero] effect
  /// case [tag] is null, the [hero] effect is applied
  /// with [urlImage] as tag
  final String? tag;

  const CustomCardGalleryImageComponent({
    required this.urlImage,
    this.onTap,
    this.tag,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Hero(
        tag: tag ?? urlImage,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: CachedNetworkImage(
              key: Key(urlImage),
              fadeInCurve: Curves.easeIn,
              imageUrl: urlImage,
              height: screenSize.height,
              width: screenSize.width,
              fit: BoxFit.cover,
              errorWidget: (_, __, ___) => const Center(
                child: Icon(
                  Icons.error,
                  color: Colors.red,
                ),
              ),
              progressIndicatorBuilder: (context, url, downloadProgress) {
                return RepaintBoundary(
                  child: Center(
                    child: CircularProgressIndicator(
                      value: downloadProgress.progress,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

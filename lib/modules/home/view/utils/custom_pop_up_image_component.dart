import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Future showPopUpImage({
  required BuildContext context,
  required String tag,
  required String urlImage,
  Widget? button,
}) {
  final Size screenSize = MediaQuery.of(context).size;

  return showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black45,
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
    ) {
      return Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: screenSize.width,
          height: screenSize.height,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Hero(
                  tag: tag,
                  child: InteractiveViewer(
                    minScale: 0.1,
                    child: CachedNetworkImage(
                      imageUrl: urlImage,
                      fadeInCurve: Curves.easeIn,
                      fit: BoxFit.cover,
                      errorWidget: (_, __, ___) => const Center(
                        child: Icon(
                          Icons.error,
                          color: Colors.red,
                        ),
                      ),
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) {
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
              Align(
                alignment: Alignment.bottomCenter,
                child: button ?? Container(),
              ),
            ],
          ),
        ),
      );
    },
  );
}

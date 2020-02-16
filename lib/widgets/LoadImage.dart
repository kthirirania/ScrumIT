import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadImage extends StatelessWidget {
  double width;
  double height;
  String imageUrl;
  double topRight = 0;
  double topLeft = 0;
  double bottomRight = 0;
  double bottomLeft = 0;

  LoadImage(this.width, this.height, this.imageUrl,
      [this.topRight, this.topLeft, this.bottomRight, this.bottomLeft]);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeft),
            topRight: Radius.circular(topRight),
            bottomRight: Radius.circular(bottomRight),
            bottomLeft: Radius.circular(bottomLeft),
          ),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey[200],
        highlightColor: Colors.grey[100],
        child: Container(
          height: height,
          width: width,
        ),
      ),
      errorWidget: (context, url, error) => Shimmer.fromColors(
        baseColor: Colors.grey[200],
        highlightColor: Colors.grey[100],
        child: Container(
          height: height,
          width: width,
        ),
      ),
    );
  }
}

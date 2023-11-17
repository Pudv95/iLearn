import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class ShimmerBlocks {
  BuildContext context;
  ShimmerBlocks({required this.context});
  Widget coursesForYouShimmer() {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.95,
      height: size.height * 0.01,
      child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            width: size.width * 0.95,
            height: size.height * 0.01,
            color: Colors.black
          )),
    );
  }
}

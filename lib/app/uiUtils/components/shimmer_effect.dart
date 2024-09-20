import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Expanded(
              child: ClipRRect(
                 borderRadius: BorderRadius.circular(8),
                child: Container(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                height: 100,
                color: Colors.white,),
              ),
            ),
          Expanded(
            child: ClipRRect(
               borderRadius: BorderRadius.circular(8),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                height: 100,
                color: Colors.white,
              ),
            ),
          ),
            ],
          )
          
        );
      },
    );
  }
}

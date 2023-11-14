import 'package:flutter/material.dart';

class MovieListItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          /// image and bookmark
          Stack(
            alignment: Alignment.topLeft,
            children: [
              Image.asset("assets/images/Mask Group 2.png"),
              Image.asset("assets/images/bookmark.png")
            ],
          ),

          const SizedBox(width: 12,),

          /// side texts
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Movie Name', style: Theme.of(context).textTheme.bodyMedium),
                Text("2023", style: Theme.of(context).textTheme.bodySmall),
                Text("Cast Names", style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
        ],
      ),
    );
  }
}

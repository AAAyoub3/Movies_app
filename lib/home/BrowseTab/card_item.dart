import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset("assets/images/sora1.png",
          fit: BoxFit.fill,

        ),
        Text("Action", style: Theme.of(context).textTheme.titleSmall,),
      ],
    );
  }
}

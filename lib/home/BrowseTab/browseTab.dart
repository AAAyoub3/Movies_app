import 'package:flutter/material.dart';
import 'card_item.dart';

class BrowseTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.1,),
          /// title
          Text('Browse Category',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          /// grid view
          Expanded(
            child: GridView.builder(
              itemBuilder: (context, index) => CardItem(),
              itemCount: 10,
              padding: const EdgeInsets.all(0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

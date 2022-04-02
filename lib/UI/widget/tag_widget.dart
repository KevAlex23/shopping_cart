import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TagWidget extends StatelessWidget {
  const TagWidget({
    Key? key,
    required this.category,
  }) : super(key: key);

  final String category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        children: [
          const Icon(CupertinoIcons.tag, size: 15,),
          Text(" "+category)
        ],
      ),
    );
  }
}
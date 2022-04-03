import 'package:flutter/material.dart';
import 'package:kev_commerce/const/style_const.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    Key? key,
    required this.title,
    required this.count,
    required this.onDelete,
  }) : super(key: key);

  final String title;
  final String count;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        actionsAlignment:
            MainAxisAlignment
                .spaceEvenly,
        shape:
            RoundedRectangleBorder(
                borderRadius:
                    BorderRadius
                        .circular(
                            10)),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                  "Cancel")),
          ElevatedButton(
              onPressed: () {
                onDelete();
                Navigator.pop(context);
              },
              child: const Text(
                  "Delete")),
        ],
        content: Column(
          mainAxisSize:
              MainAxisSize.min,
          children: [
            Icon(
              Icons.delete_sweep,
              color: Colors
                  .redAccent
                  .shade200,
            ),
            Text(
              "You are about to delete ",
              style:
                  titleTextStyle,
              textAlign: TextAlign
                  .center,
            ),
            RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.grey.shade700),
                  children: [
                    const TextSpan(
                        text:
                            "\nThis will delete ",),
                    TextSpan(
                        text:
                            "$count $title",style: buttonTextStyle),
                    const TextSpan(
                        text:
                            " from your cart\nAre you sure?",)
                  ]),
              textAlign: TextAlign
                  .center,
            )
          ],
        ));
  }
}
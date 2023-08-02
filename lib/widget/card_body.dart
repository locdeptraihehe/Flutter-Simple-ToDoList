import 'package:flutter/material.dart';
import 'package:confirm_dialog/confirm_dialog.dart';

// ignore: must_be_immutable
class CardBody extends StatelessWidget {
  CardBody(
      {Key? key,
      required this.index,
      required this.item,
      required this.handleDelete})
      : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  int index;
  var item;
  final Function handleDelete;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: (index % 2 == 0)
            ? const Color.fromRGBO(255, 51, 246, 1)
            : const Color.fromRGBO(255, 241, 141, 233),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(item.name,
              style: const TextStyle(
                fontSize: 24,
                color: Color(0xff4B4B4B),
                fontWeight: FontWeight.bold,
              )),
          InkWell(
            onTap: () async {
              if (await confirm(context)) {
                handleDelete(item.id);
              }
              return print('pressedCancel');
            },
            child: const Icon(
              Icons.delete_outline,
              color: Color(0xff4B4B4B),
              size: 30,
            ),
          ),
        ]),
      ),
    );
  }
}

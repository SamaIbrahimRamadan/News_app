import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  String text, text1;
  String img;
  CustomRow({
    super.key,
    required this.text,
    required this.text1,
    required this.img,
  }) {}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: 120,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Image.network(
                  img,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: SizedBox(
                  height: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        text,
                        maxLines: 3,
                        //overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        text1,
                        style: Theme.of(context).textTheme.bodyText1,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const SizedBox(
          width: 350,
          child: Divider(
            height: 3,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

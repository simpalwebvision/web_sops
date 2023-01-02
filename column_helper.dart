import 'package:flutter/material.dart';

class ColumnHelper extends StatelessWidget {
  final String? mainText;
  final String? imagePath;
  final VoidCallback? onpressed;
  const ColumnHelper({Key? key, this.mainText, this.imagePath, this.onpressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                imagePath!,
                scale: 2,
              ),
              Text(
                mainText!,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class DropdownView extends StatefulWidget {
  const DropdownView({super.key});

  @override
  State<DropdownView> createState() => _DropdownViewState();
}

class _DropdownViewState extends State<DropdownView> {
  List<String> items = [
    'Red',
    'Green',
    'Orange',
    'Blue',
    'Black',
  ];

  String dropdownValue = 'Red';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButton<String>(
          value: dropdownValue,
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue ?? '';
            });
          },
        ),
      ),
    );
  }
}

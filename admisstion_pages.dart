import 'package:flutter/material.dart';
import 'package:weblord/datepicker_screen.dart';

class AdmisstionPages extends StatefulWidget {
  const AdmisstionPages({Key? key}) : super(key: key);

  @override
  State<AdmisstionPages> createState() => _AdmisstionPagesState();
}

class _AdmisstionPagesState extends State<AdmisstionPages> {
  String? gender; //no radio button will be selected
  //String gender = "male"; //if you want to set default value
  List dropDownListData = [
    {"title": "Virar(E)", "value": "1"},
    {"title": "Virar(W)", "value": "2"},
    {"title": "NSP(E)", "value": "3"},
    {"title": "NSP(W)", "value": "4"},
  ];

  String defaultValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Work area",
          style: TextStyle(color: Color.fromARGB(255, 250, 98, 87)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InputDecorator(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                contentPadding: const EdgeInsets.all(10),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                    isDense: true,
                    value: defaultValue,
                    isExpanded: true,
                    menuMaxHeight: 350,
                    items: [
                      const DropdownMenuItem(
                          child: Text(
                            "Select area Station",
                          ),
                          value: ""),
                      ...dropDownListData.map<DropdownMenuItem<String>>((data) {
                        return DropdownMenuItem(
                            child: Text(data['title']), value: data['value']);
                      }).toList(),
                    ],
                    onChanged: (value) {
                      print("");
                      setState(() {
                        defaultValue = value!;
                      });
                    }),
              ),
            ),
          ),
          ExpansionTile(
            title: Text('Select Faculty'),
            children: [
              ListTile(
                onTap: () {},
                title: Text('Select Faculty'),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Select Progroam'),
            children: [
              ListTile(
                onTap: () {},
                title: Text('Select Progroam'),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Select '),
            children: [
              ListTile(
                onTap: () {},
                title: Text('Select '),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Select '),
            children: [
              ListTile(
                onTap: () {},
                title: Text('Select '),
              ),
            ],
          ),
          InputDecorator(
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
              contentPadding: const EdgeInsets.all(10),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                  isDense: true,
                  value: defaultValue,
                  isExpanded: true,
                  menuMaxHeight: 350,
                  items: [
                    const DropdownMenuItem(
                        child: Text(
                          "Select area Station",
                        ),
                        value: ""),
                    ...dropDownListData.map<DropdownMenuItem<String>>((data) {
                      return DropdownMenuItem(
                          child: Text(data['title']), value: data['value']);
                    }).toList(),
                  ],
                  onChanged: (value) {
                    print("");
                    setState(() {
                      defaultValue = value!;
                    });
                  }),
            ),
          ),
          TextField(
            cursorColor: Color(0xffF5591F),
            decoration: InputDecoration(
              hintText: "Name Of condidate",
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
          TextField(
            cursorColor: Color(0xffF5591F),
            decoration: InputDecoration(
              hintText: "Father/Husband Name",
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
          TextField(
            cursorColor: Color(0xffF5591F),
            decoration: InputDecoration(
              hintText: "Mother Name",
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
          TextField(
            cursorColor: Color(0xffF5591F),
            decoration: InputDecoration(
              hintText: "Email ID",
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  "What is your gender?",
                  style: TextStyle(fontSize: 18),
                ),
                Divider(),
                RadioListTile(
                  title: Text("Male"),
                  value: "male",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: Text("Female"),
                  value: "female",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: Text("Other"),
                  value: "other",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DatePickerScreen()));
                  },
                  child: const Text('Select A Date'),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

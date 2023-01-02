import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:weblord/controller/auth_controller.dart';

class ProfilePages extends StatefulWidget {
  const ProfilePages({Key? key}) : super(key: key);

  @override
  State<ProfilePages> createState() => _ProfilePagesState();
}

class _ProfilePagesState extends State<ProfilePages> {
  File? pickedImages;
  void imagePickerOption() {
    Get.bottomSheet(
      SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: Container(
            color: Colors.white,
            height: 250,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Pic Image From",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      pickImage(ImageSource.camera);
                    },
                    icon: const Icon(Icons.camera),
                    label: const Text("CAMERA"),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      pickImage(ImageSource.gallery);
                    },
                    icon: const Icon(Icons.image),
                    label: const Text("GALLERY"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close),
                    label: const Text("CANCEL"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  pickImage(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImages = tempImage;
      });

      Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey();
  Map<String, String> _loginUserData = {
    'email': '',
    'password': '',
  };

  _submit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    print(_loginUserData);
    AuthController.login(_loginUserData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 50,
          ),
          Align(
            alignment: Alignment.center,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.indigo, width: 5),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                  child: ClipOval(
                    child: pickedImages != null
                        ? Image.file(
                            pickedImages!,
                            width: 170,
                            height: 170,
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            'https://upload.wikimedia.org/wikipedia/commons/5/5f/Alberto_conversi_profile_pic.jpg',
                            width: 170,
                            height: 170,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 5,
                  child: IconButton(
                    onPressed: imagePickerOption,
                    icon: const Icon(
                      Icons.add_a_photo_outlined,
                      color: Colors.blue,
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
                onPressed: imagePickerOption,
                icon: const Icon(Icons.add_a_photo_sharp),
                label: const Text('UPLOAD IMAGE')),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "Name"),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value!.isEmpty || !value.contains('@')) {
                return 'Invalid email';
              }
              return null;
            },
            onSaved: (value) {
              _loginUserData['email'] = value!;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "Email"),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value!.isEmpty || !value.contains('@')) {
                return 'Invalid email';
              }
              return null;
            },
            onSaved: (value) {
              _loginUserData['email'] = value!;
            },
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Password",
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Password required!';
              } else {
                return null;
              }
            },
            onSaved: (value) {
              _loginUserData['password'] = value!;
            },
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: _submit,
            child: Text(
              "Login ",
              style: TextStyle(fontSize: 15, color: Colors.brown),
            ),
          ),
        ],
      ),
    );
  }
}

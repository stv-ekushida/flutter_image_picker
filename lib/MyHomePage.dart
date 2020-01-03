import 'package:flutter/material.dart';
import 'dart:io';

//ライブラリ
import 'package:image_picker/image_picker.dart';
import 'package:compressimage/compressimage.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File _photoImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Demo'),
      ),
      body: Center(
        child: _photoImage == null
            ? Text('No image selected.')
            : Image.file(_photoImage),
      ),
      floatingActionButton: _showFAB(),
    );
  }

  Widget _showFAB() {
    return FloatingActionButton(
      onPressed: _getImage,
      tooltip: 'Pick Image',
      child: Icon(Icons.photo),
    );
  }

  Future _getImage() async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);

    print('File Size Before : ${image.lengthSync().toString()}');

    //80%圧縮
    await CompressImage.compress(imageSrc: image.path, desiredQuality: 80);

    print('File Size After : ${image.lengthSync().toString()}');

    setState(() {
      _photoImage = image;
    });
  }
}

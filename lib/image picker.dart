import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MaterialApp(
    home: ImageFilePickerScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class ImageFilePickerScreen extends StatefulWidget {
  @override
  _ImageFilePickerScreenState createState() => _ImageFilePickerScreenState();
}

class _ImageFilePickerScreenState extends State<ImageFilePickerScreen> {
  File? _pickedImage;
  File? _pickedFile;
  final ImagePicker _imagePicker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final XFile? img = await _imagePicker.pickImage(source: source);
    if (img != null) {
      setState(() => _pickedImage = File(img.path));
    }
  }

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.single.path != null) {
      setState(() => _pickedFile = File(result.files.single.path!));
    }
  }

  void _deleteSelections() {
    setState(() {
      _pickedImage = null;
      _pickedFile = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image & File Picker"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.blueGrey[50],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                _pickedImage != null
                    ? Image.file(_pickedImage!, height: 100)
                    : Text("No image selected"),
                SizedBox(height: 20),
                _pickedFile != null
                    ? Text("Picked file: ${_pickedFile!.path.split('/').last}")
                    : Text("No file selected"),
                SizedBox(height: 40),
                ElevatedButton.icon(
                  icon: Icon(Icons.camera_alt),
                  label: Text("Pick Image (Camera)"),
                  onPressed: () => _pickImage(ImageSource.camera),
                ),
                ElevatedButton.icon(
                  icon: Icon(Icons.photo),
                  label: Text("Pick Image (Gallery)"),
                  onPressed: () => _pickImage(ImageSource.gallery),
                ),
                ElevatedButton.icon(
                  icon: Icon(Icons.attach_file),
                  label: Text("Pick File"),
                  onPressed: _pickFile,
                ),
              ],
            ),
          ),
          if (_pickedImage != null || _pickedFile != null)
            Positioned(
              top: 10,
              right: 10,
              child: IconButton(
                icon: Icon(Icons.delete_outline_outlined, color: Colors.red),
                onPressed: _deleteSelections,
              ),
            ),
        ],
      ),
    );
  }
}
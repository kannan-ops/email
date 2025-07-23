import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

class PickerExample extends StatefulWidget {
  @override
  _PickerExampleState createState() => _PickerExampleState();
}

class _PickerExampleState extends State<PickerExample> {
  File? _selectedImage;
  File? _selectedFile;
  final ImagePicker _imagePicker = ImagePicker();

  Future<void> _pickImage(ImageSource location) async {
    final XFile? pickedImage = await _imagePicker.pickImage(source: location);
    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Image & File Picker")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _selectedImage != null
                ? Image.file(_selectedImage!, height:200 )
                : Text("No image selected"),
            SizedBox(height: 16),
            _selectedFile != null
                ? Text("Selected file: ${_selectedFile!.path.split('/').last}")
                : Text("No file selected"),


            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  icon: Icon(Icons.photo),
                  label: Text("Gallery"),
                  onPressed: () => _pickImage(ImageSource.gallery),
                ),
                ElevatedButton.icon(
                  icon: Icon(Icons.camera_alt),
                  label: Text("Camera"),
                  onPressed: () => _pickImage(ImageSource.camera),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              icon: Icon(Icons.attach_file),
              label: Text("Pick File"),
              onPressed: _pickFile,
            ),
          ],
        ),
      ),
    );
  }
}
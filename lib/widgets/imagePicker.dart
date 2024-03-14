import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomImagePicker extends StatefulWidget {
  final Function(XFile?) onImageSelected;

  const CustomImagePicker({Key? key, required this.onImageSelected})
      : super(key: key);

  @override
  State<CustomImagePicker> createState() => _CustomImagePickerState();

  // Method to show image picker dialog
  static Future<void> showImagePickerDialog(BuildContext context, Function(XFile?) onImageSelected) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          alignment: Alignment.bottomCenter,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () async {
                  XFile? image = await ImagePicker().pickImage(source: ImageSource.camera);
                  onImageSelected(image);
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.camera_alt_outlined,
                  color: Color(0x7F373737),
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () async {
                  XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
                  onImageSelected(image);
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.photo_outlined,
                  color: Color(0x7F373737),
                  size: 30,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  @override
  Widget build(BuildContext context) {
    // We don't need to put any logic here
    return SizedBox.shrink();
  }
}

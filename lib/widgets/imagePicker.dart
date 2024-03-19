import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomImagePicker extends StatelessWidget {
  final Function(XFile?) onImageSelected;

  const CustomImagePicker({Key? key, required this.onImageSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.shrink();
  }

  static const Color iconColor = Color(0x7F373737);

  static Future<XFile?> showImagePickerDialog(BuildContext context) async {
  return showDialog<XFile?>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        alignment: Alignment.bottomCenter,
        contentPadding: EdgeInsets.all(16),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () async {
                XFile? image = await ImagePicker().pickImage(source: ImageSource.camera);
                Navigator.of(context).pop(image);
              },
              icon: Icon(
                Icons.camera_alt_outlined,
                color: iconColor,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () async {
                XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
                Navigator.of(context).pop(image);
              },
              icon: Icon(
                Icons.photo_outlined,
                color: iconColor,
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

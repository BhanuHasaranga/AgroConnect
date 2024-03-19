import '../widgets/imagePicker.dart';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';

class AskQuestion extends StatefulWidget {
  const AskQuestion({Key? key}) : super(key: key);

  @override
  State<AskQuestion> createState() => _AskQuestionState();
}

class _AskQuestionState extends State<AskQuestion> {
  String headline = "";
  String news = "";
  List<XFile?> selectedImages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ask Question",
          style: TextStyle(
            color: Color(0xFF373737),
            fontSize: 25,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            _buildUserDetails(),
            const SizedBox(height: 15),
            _buildTextField(
              label: 'Write Your Question here',
              maxLength: 50,
              onChanged: (value) => setState(() => headline = value),
            ),
            const SizedBox(height: 10),
            _buildTextField(
              label: 'Describe your Question!',
              maxLength: 200,
              maxLines: 5,
              onChanged: (value) => setState(() => news = value),
            ),
            const SizedBox(height: 10),
            _buildImagePicker(),
            const SizedBox(height: 20),
            _buildImageGrid(),
            const SizedBox(height: 20),
            _buildPostButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildUserDetails() {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage('lib/assets/user.png'),
          ),
        ),
        const Text(
          'Jane Miles',
          style: TextStyle(
            color: Color(0xFF373737),
            fontSize: 15,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            letterSpacing: 0.15,
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required String label,
    required int maxLength,
    int maxLines = 1,
    required ValueChanged<String> onChanged,
  }) {
    return TextField(
      maxLength: maxLength,
      maxLines: maxLines,
      onSubmitted: onChanged,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        hintText: label,
        hintStyle: const TextStyle(
          color: Color(0x7F373737),
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildImagePicker() {
    return GestureDetector(
      onTap: _selectImage,
      child: DottedBorder(
        dashPattern: [8, 8],
        radius: const Radius.circular(5),
        color: const Color(0xFF373737),
        child: Container(
          height: 100,
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add_photo_alternate_outlined,
                  color: Color(0x7F373737),
                  size: 30,
                ),
                SizedBox(height: 10),
                Text(
                  'Upload Photos/Videos',
                  style: TextStyle(
                    color: Color(0x7F373737),
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.24,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageGrid() {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
      ),
      itemCount: selectedImages.length,
      itemBuilder: (context, index) {
        return selectedImages[index] == null
            ? const Icon(
                Icons.image,
                color: Color(0x7F373737),
                size: 100,
              )
            : Image.file(
                File(selectedImages[index]!.path),
                width: 75,
                height: 75,
                fit: BoxFit.fill,
              );
      },
    );
  }

  Widget _buildPostButton() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              backgroundColor: const Color(0xFF4E7D4C),
              padding: const EdgeInsets.all(0),
              fixedSize: const Size.fromHeight(50),
            ),
            child: const Text(
              'Ask your Quesion',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _selectImage() async {
    if (selectedImages.length >= 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('You can\'t select more than 4 images'),
        ),
      );
      return;
    }

    XFile? image = await CustomImagePicker.showImagePickerDialog(context);
    if (image != null) {
      setState(() {
        selectedImages.add(image);
        print('Selected Images:');
        for (var i = 0; i < selectedImages.length; i++) {
          print(selectedImages[i]?.path);
        }
      });
    }
  }
}

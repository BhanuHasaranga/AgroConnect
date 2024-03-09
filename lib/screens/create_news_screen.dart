import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class CreateNews extends StatefulWidget {
  const CreateNews({Key? key}) : super(key: key);

  @override
  State<CreateNews> createState() => _CreateNewsState();
}

class _CreateNewsState extends State<CreateNews> {
  String headline = "";
  String news = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Create News",
          style: TextStyle(
            color: Color(0xFF373737),
            fontSize: 25,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const CircleAvatar(
                    radius: 15,
                    backgroundImage: AssetImage(
                      'lib/assets/user.png',
                    ),
                  ),
                ),
                const Text(
                  'Jane Miles',
                  style: TextStyle(
                    color: Color(0xFF373737),
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 0,
                    letterSpacing: 0.15,
                  ),
                ),
              ],
            ),
            // Text(
            //   headline,
            //   style: const TextStyle(
            //     color: Color(0xFF373737),
            //   ),
            // ),
            TextField(
              maxLength: 50,
              onSubmitted: (String str) {
                setState(() {
                  headline = str;
                });
              },
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                hintText: 'Write Your headline here',
                hintStyle: const TextStyle(
                  color: Color(0x7F373737),
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              maxLength: 500,
              maxLines: 5,
              // minLines: 1,
              onSubmitted: (String str) {
                setState(() {
                  news = str;
                });
              },
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                hintText: 'Write your News!',
                hintStyle: const TextStyle(
                  color: Color(0x7F373737),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            DottedBorder(
              // strokeWidth: 1,
              dashPattern: [8, 8],
              radius: Radius.circular(5),
              color: Color(0xFF373737),
              child: Container(
                height: 100,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_photo_alternate_outlined,
                        color: Color(0x7F373737),
                        size: 30,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Upload Photos/Videos',
                        style: TextStyle(
                          color: Color(0x7F373737),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0,
                          letterSpacing: -0.24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFF4E7D4C)),
                      fixedSize: MaterialStateProperty.all<Size>(
                        const Size.fromHeight(
                            50), // Set the desired height here
                      ),
                    ),
                    child: const Text(
                      'Post your News',
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
            ),
          ],
        ),
      ),
    );
  }
}

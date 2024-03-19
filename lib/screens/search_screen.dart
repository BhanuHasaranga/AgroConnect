import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String _searchText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search',
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
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SearchBar(
              padding: const MaterialStatePropertyAll<EdgeInsets>(
                EdgeInsets.symmetric(horizontal: 16.0),
              ),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  side: const BorderSide(
                    color: Color(0xFF373737),
                    width: 2.0,
                  ),
                ),
              ),
              hintText: 'Search chats, news or communities',
              leading: const Icon(
                Icons.search,
                color: Color(0xFF373737),
              ),
              elevation: MaterialStateProperty.all<double>(0.0),
              onChanged: (value) {
                setState(() {
                  _searchText = value;
                });
              },
            ),
            // You can use _searchText here to filter your data or perform any other actions
          ],
        ),
      ),
    );
  }
}

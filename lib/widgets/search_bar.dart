import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final String query;
  final ValueChanged<String> onChanged;

  const SearchBar({super.key, required this.query, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: 'Search planet...',
          hintStyle: const TextStyle(color: Colors.white54, fontSize: 14),
          prefixIcon: const Icon(Icons.search, color: Colors.white70),
          filled: true,
          fillColor: Colors.white.withOpacity(0.06), 
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide.none,
          ),
        ),
        cursorColor: Colors.white, 
        onChanged: onChanged,
      ),
    );
  }
}

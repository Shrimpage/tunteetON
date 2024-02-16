import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Asetukset extends StatefulWidget {
  const Asetukset({super.key});

  @override
  _AsetuksetSivuState createState() => _AsetuksetSivuState();
}

class _AsetuksetSivuState extends State<Asetukset> {
  bool _darkMode = false;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  _loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _darkMode = prefs.getBool('darkMode') ?? false;
    });
  }

  _saveSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkMode', _darkMode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(color: _darkMode ? Colors.white : Colors.black), // Change title color based on dark mode
        ),
        backgroundColor: _darkMode ? Colors.grey[900] : Colors.white, // Change app bar background color based on dark mode
      ),
      backgroundColor: _darkMode ? Colors.grey[800] : Colors.grey[200], // Change page background color based on dark mode
      body: ListView(
        children: <Widget>[
          SwitchListTile(
            title: Text(
              'Dark Mode',
              style: TextStyle(color: _darkMode ? Colors.white : Colors.black), // Change text color based on dark mode
            ),
            value: _darkMode,
            onChanged: (value) {
              setState(() {
                _darkMode = value;
              });
              _saveSettings();
            },
          ),
          // Add more settings widgets here as needed
        ],
      ),
    );
  }
}

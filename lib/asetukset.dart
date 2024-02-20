import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Asetukset extends StatefulWidget {
  const Asetukset({required Key key}) : super(key: key);

  @override
  _AsetuksetSivuState createState() => _AsetuksetSivuState();
}

class _AsetuksetSivuState extends State<Asetukset> {
  bool _darkMode = false;
  int _moodsPerDay = 3; // Default moods per day

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  _loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _darkMode = prefs.getBool('darkMode') ?? false;
      _moodsPerDay = prefs.getInt('moodsPerDay') ?? 3; // Default moods per day if not set
    });
  }

  _saveSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkMode', _darkMode);
    prefs.setInt('moodsPerDay', _moodsPerDay);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back), color: _darkMode ? Colors.white : Colors.black ,onPressed: () => Navigator.pushNamed(context, '/home'),),
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
          ListTile(
            title: Text(
              'Moods per day',
              style: TextStyle(color: _darkMode ? Colors.white : Colors.black), // Change text color based on dark mode
            ),
            trailing: DropdownButton<int>(
              value: _moodsPerDay,
              dropdownColor: _darkMode ? Colors.grey[900] : Colors.white, // Change dropdown menu color based on dark mode
              elevation: 8, // Increase elevation for a shadow effect
              style: TextStyle(
              color: _darkMode ? Colors.white : Colors.black,
              fontSize: 20,
              ),
              underline: Container(
              height: 2,
              color: _darkMode ? Colors.white : Colors.black, // Customize the underline color
              ),
              icon: Icon(
              Icons.arrow_drop_down, // Add a dropdown icon
              color: _darkMode ? Colors.white : Colors.black,
              ),
              items: <int>[3, 5, 7].map((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(
                    '$value',
                    style: TextStyle(
                      color: _darkMode ? Colors.white : Colors.black, // Change dropdown item text color based on dark mode
                      fontSize: 20,
                  ),),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _moodsPerDay = value!.toInt();
                });
                _saveSettings();
              },
            ),
          ),
          // Add more settings widgets here as needed
        ],
      ),
    );
  }
}

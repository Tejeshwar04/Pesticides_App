import 'package:flutter/material.dart';
import 'dart:async';

class SelectLanguagePage extends StatefulWidget {
  @override
  _SelectLanguagePageState createState() => _SelectLanguagePageState();
}

class _SelectLanguagePageState extends State<SelectLanguagePage> {
  String _selectedLanguage = '';
  List<String> _displayedLines = [];
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _updateDisplayedText(String language) {
    setState(() {
      _displayedLines = []; // Clear the displayed lines
    });
    List<String> lines = language.split(' '); // Splitting language into lines (space-separated)
    int index = 0;
    // Set timer for line-by-line effect
    _timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      setState(() {
        if (index < lines.length) {
          _displayedLines.add(lines[index]);
          index++;
        } else {
          _timer?.cancel(); // Stop the timer when all lines are displayed
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set background color to black
      appBar: AppBar(
        title: Text('Language'),
        backgroundColor: Color(0xFFE8E5E5), // Use your preferred AppBar color
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              child: Column(
                key: ValueKey<List<String>>(_displayedLines),
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _displayedLines.map((line) => Text(
                  line,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Set text color to white for better contrast
                  ),
                )).toList(),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              children: [
                _buildLanguageOption('assets/flags/dk.png', 'Denmark (Danish)', 'da'),
                _buildLanguageOption('assets/flags/us.png', 'United States (English)', 'en_us'),
                _buildLanguageOption('assets/flags/cn.png', 'China (Mandarin Chinese)', 'zh'),
                _buildLanguageOption('assets/flags/in.png', 'India (English)', 'en_in'),
                _buildLanguageOption('assets/flags/jp.png', 'Japan (Japanese)', 'ja'),
                _buildLanguageOption('assets/flags/de.png', 'Germany (German)', 'de'),
                _buildLanguageOption('assets/flags/uk.png', 'United Kingdom (English)', 'en_uk'),
                _buildLanguageOption('assets/flags/fr.png', 'France (French)', 'fr'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageOption(String flagPath, String language, String languageCode) {
    return ListTile(
      leading: Image.asset(
        flagPath,
        width: 40,
        height: 40,
      ),
      title: Text(
        language,
        style: TextStyle(color: Colors.white), // Set text color to white for better contrast
      ),
      trailing: _selectedLanguage == languageCode
          ? Icon(Icons.check_circle, color: Color(0xFF1A5319)) // Green checkmark for selected language
          : Icon(Icons.radio_button_off, color: Colors.grey), // Grey radio button for unselected languages
      onTap: () {
        setState(() {
          _selectedLanguage = languageCode;
        });
        _updateDisplayedText(language); // Call function to animate text display line by line
        // Navigate to the next screen or perform other actions
        Navigator.pushNamed(context, '/login'); // Adjust navigation as needed
      },
    );
  }
}

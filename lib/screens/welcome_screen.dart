import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final TextEditingController _nameController = TextEditingController();
  bool _isNameValid = false;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _validateName(String value) {
    setState(() {
      _isNameValid = value.trim().isNotEmpty;
    });
  }

  void _startQuiz() {
    if (_isNameValid) {
      final name = _nameController.text.trim();
      // Navigate ke dashboard dengan nama user
      Navigator.pushReplacementNamed(
        context,
        '/dashboard',
        arguments: name,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: screenHeight * 0.08),

                // Welcome Illustration
                Container(
                  height: screenHeight * 0.25,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD4D4F0),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.pets,
                          size: screenWidth * 0.25,
                          color: Colors.black87,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Text(
                          '🐸 🦅 🐬',
                          style: TextStyle(
                            fontSize: screenWidth * 0.12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: screenHeight * 0.05),

                // Welcome Text
                Text(
                  'Welcome to\nWild Quiz!',
                  style: TextStyle(
                    fontSize: screenWidth * 0.1,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    height: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: screenHeight * 0.02),

                Text(
                  'Test your knowledge about amazing\nanimals and their habitats',
                  style: TextStyle(
                    fontSize: screenWidth * 0.042,
                    color: Colors.black54,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: screenHeight * 0.05),

                // Name Input Field
                Text(
                  'What\'s your name?',
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),

                SizedBox(height: screenHeight * 0.015),

                TextField(
                  controller: _nameController,
                  onChanged: _validateName,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    hintText: 'Enter your name',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: screenWidth * 0.042,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                      vertical: screenHeight * 0.02,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.grey.shade200,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                SizedBox(height: screenHeight * 0.05),

                // Start Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isNameValid ? _startQuiz : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                      _isNameValid ? Colors.black : Colors.grey.shade300,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.022,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 0,
                      disabledBackgroundColor: Colors.grey.shade300,
                      disabledForegroundColor: Colors.grey.shade500,
                    ),
                    child: Text(
                      'Start Now',
                      style: TextStyle(
                        fontSize: screenWidth * 0.048,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: screenHeight * 0.03),

                // Info Text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: screenWidth * 0.04,
                      color: Colors.black45,
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    Text(
                      '3 questions • Multiple choice',
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        color: Colors.black45,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: screenHeight * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
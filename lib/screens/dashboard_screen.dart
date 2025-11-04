import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/quiz_provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Ambil nama user dari arguments (jika ada)
    final userName = ModalRoute.of(context)?.settings.arguments as String?;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  "Let's Discover\nthe Wild!",
                  style: TextStyle(
                    fontSize: screenWidth * 0.095,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF000000),
                    height: 1.2,
                  ),
                ),

                SizedBox(height: screenHeight * 0.03),

                // Category Chips
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildCategoryChip('All', true, screenWidth),
                      SizedBox(width: screenWidth * 0.025),
                      _buildCategoryChip('🌲 Forest', false, screenWidth),
                      SizedBox(width: screenWidth * 0.025),
                      _buildCategoryChip('🌊 Oceans', false, screenWidth),
                    ],
                  ),
                ),

                SizedBox(height: screenHeight * 0.03),

                // Main Featured Card - Dolphin
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEDAFF),
                    borderRadius: BorderRadius.circular(screenWidth * 0.08),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image Container
                      Container(
                        height: screenHeight * 0.25,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(screenWidth * 0.08),
                            topRight: Radius.circular(screenWidth * 0.08),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(screenWidth * 0.08),
                            topRight: Radius.circular(screenWidth * 0.08),
                          ),
                          child: Image.asset(
                            'assets/images/dolphin_coral.png',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: const Color(0xFFB8E0F6),
                                child: Center(
                                  child: Icon(
                                    Icons.image,
                                    size: screenWidth * 0.2,
                                    color: Colors.white54,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                      // Card Content
                      Padding(
                        padding: EdgeInsets.all(screenWidth * 0.05),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dive into sea creatures',
                              style: TextStyle(
                                fontSize: screenWidth * 0.052,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.01),
                            Row(
                              children: [
                                Container(
                                  width: screenWidth * 0.052,
                                  height: screenWidth * 0.052,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFFFC107),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                SizedBox(width: screenWidth * 0.02),
                                Text(
                                  '1,250 points',
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.042,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: screenHeight * 0.025),

                // Bottom Two Cards Row
                Row(
                  children: [
                    // Frog Card - CLICKABLE KE QUIZ
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          // Reset quiz sebelum mulai
                          Provider.of<QuizProvider>(context, listen: false)
                              .resetQuiz();
                          // Navigate ke quiz
                          Navigator.pushNamed(context, '/quiz');
                        },
                        child: _buildSmallCard(
                          context,
                          'Froggy Friends\nand Foes',
                          '948 points',
                          const LinearGradient(
                            colors: [
                              Color(0xFFD5F5E3),
                              Color(0xFFE8F8F5),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          const Color(0xFFA8E6CF),
                          'assets/images/frog.png', // Path gambar frog
                        ),
                      ),
                    ),

                    SizedBox(width: screenWidth * 0.04),

                    // Bird Card
                    Expanded(
                      child: _buildSmallCard(
                        context,
                        'Bird Calls and\nSongs',
                        '948 points',
                        const LinearGradient(
                          colors: [
                            Color(0xFFFAE5D3),
                            Color(0xFFFFF4E6),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        const Color(0xFFFFDDB3),
                        'assets/images/bird.png', // Path gambar bird
                      ),
                    ),
                  ],
                ),

                SizedBox(height: screenHeight * 0.025),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label, bool isActive, double screenWidth) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.052,
        vertical: screenWidth * 0.032,
      ),
      decoration: BoxDecoration(
        color: isActive ? Colors.black : const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(screenWidth * 0.065),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.black,
          fontSize: screenWidth * 0.037,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildSmallCard(
      BuildContext context,
      String title,
      String points,
      Gradient gradient,
      Color placeholderColor,
      String imagePath, // Tambah parameter untuk path gambar
      ) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(screenWidth * 0.08),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Container
          Container(
            height: screenHeight * 0.17,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(screenWidth * 0.08),
                topRight: Radius.circular(screenWidth * 0.08),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(screenWidth * 0.08),
                topRight: Radius.circular(screenWidth * 0.08),
              ),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  // Jika gambar error, tampilkan placeholder
                  return Container(
                    color: placeholderColor,
                    child: Center(
                      child: Icon(
                        Icons.image,
                        size: screenWidth * 0.13,
                        color: Colors.white54,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // Card Content
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: screenWidth * 0.042,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    height: 1.2,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Row(
                  children: [
                    Container(
                      width: screenWidth * 0.042,
                      height: screenWidth * 0.042,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFC107),
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.015),
                    Text(
                      points,
                      style: TextStyle(
                        fontSize: screenWidth * 0.034,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
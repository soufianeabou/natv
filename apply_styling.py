import re

# Apply styling to frequencies page
with open('lib/pages/frequencies_copy/frequencies_copy_widget.dart', 'r') as f:
    content = f.read()

# Replace body section with premium styling
old_body = r'body: SafeArea\(\s*top: true,\s*child:.*?\),'
new_body = '''body: SafeArea(
          top: true,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF0F172A), // Dark navy
                  Color(0xFF1E293B), // Slate
                  Color(0xFF162F6A), // Brand blue
                ],
                stops: [0.0, 0.6, 1.0],
              ),
            ),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  // Hero Section
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(16),
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF162F6A).withOpacity(0.9),
                          Color(0xFF0F172A).withOpacity(0.8),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.1),
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF162F6A).withOpacity(0.3),
                          blurRadius: 15,
                          offset: Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.satellite_alt_outlined,
                          size: 48,
                          color: Color(0xFFC8AB6B),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'ترددات البث الفضائي',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.changa(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                color: Color(0xFFC8AB6B).withOpacity(0.3),
                                blurRadius: 8,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'North Africa TV',
                          style: GoogleFonts.lato(
                            color: Color(0xFFC8AB6B),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // Frequencies Content
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.03),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.1),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        // Section Header
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Container(
                                width: 4,
                                height: 24,
                                decoration: BoxDecoration(
                                  color: Color(0xFFC8AB6B),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                              SizedBox(width: 12),
                              Text(
                                'معلومات التردد',
                                style: GoogleFonts.changa(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.settings_input_antenna_outlined,
                                color: Color(0xFFC8AB6B),
                                size: 24,
                              ),
                            ],
                          ),
                        ),
                        
                        // Frequencies List
                        Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            children: [
                              _buildFrequencyCard(
                                'Nilesat 201',
                                '7° West',
                                '10719 V',
                                '27500',
                                '3/4',
                                'HD',
                                Icons.satellite,
                                [Color(0xFFDC2626), Color(0xFF991B1B)],
                              ),
                              _buildFrequencyCard(
                                'Arabsat BADR-4',
                                '26° East',
                                '10719 H',
                                '22000',
                                '5/6',
                                'SD',
                                Icons.satellite,
                                [Color(0xFF2563EB), Color(0xFF1E3A8A)],
                              ),
                              _buildFrequencyCard(
                                'Hotbird 13E',
                                '13° East',
                                '10719 V',
                                '27500',
                                '3/4',
                                'HD',
                                Icons.satellite,
                                [Color(0xFF059669), Color(0xFF047857)],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),'''

content = re.sub(old_body, new_body, content, flags=re.DOTALL)

# Add helper methods
helper_methods = '''
  // Helper method for building frequency cards
  Widget _buildFrequencyCard(String satellite, String position, String frequency, String symbolRate, String fec, String quality, IconData icon, List<Color> gradientColors) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white.withOpacity(0.08),
              Colors.white.withOpacity(0.03),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.white.withOpacity(0.1),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              // Icon
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: gradientColors,
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: gradientColors[0].withOpacity(0.3),
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              SizedBox(width: 16),
              
              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      satellite,
                      style: GoogleFonts.changa(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      position,
                      style: GoogleFonts.lato(
                        color: Color(0xFFC8AB6B),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        _buildInfoChip('Freq: \$frequency', Colors.white70),
                        SizedBox(width: 8),
                        _buildInfoChip('SR: \$symbolRate', Colors.white70),
                        SizedBox(width: 8),
                        _buildInfoChip('FEC: \$fec', Colors.white70),
                      ],
                    ),
                  ],
                ),
              ),
              
              // Quality Badge
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: gradientColors[0].withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: gradientColors[0].withOpacity(0.5),
                    width: 1,
                  ),
                ),
                child: Text(
                  quality,
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method for info chips
  Widget _buildInfoChip(String text, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: GoogleFonts.lato(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
'''

# Add helper methods before the closing brace
content = content.replace('}', helper_methods + '\n}')

with open('lib/pages/frequencies_copy/frequencies_copy_widget.dart', 'w') as f:
    f.write(content)

print("✅ Frequencies page styled successfully!")

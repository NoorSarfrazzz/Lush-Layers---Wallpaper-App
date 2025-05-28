import 'package:flutter/material.dart';

class BotScreen extends StatefulWidget {
  const BotScreen({super.key});

  @override
  State<BotScreen> createState() => _BotScreenState();
}

class _BotScreenState extends State<BotScreen> {
  String activeSection = 'All';
  Widget buildSectionButton(String sectionName) {
    bool isActive = activeSection == sectionName;
    Color activeColor = Color(0xFF1467F4);
    Color inactiveColor = Color(0xFF242E49);

    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(isActive ? activeColor : inactiveColor),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      onPressed: () {
        setState(() {
          activeSection = sectionName;
        });
      },
      child: Text(
        sectionName,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  // Widget buildSection(String sectionName) {
  //   switch (sectionName) {
  //     case 'All':
  //       return AllPage();
  //     case 'Social':
  //       return SocialPage();
  //     case 'Education':
  //       return EducationPage();
  //     case 'Career & Business':
  //       return CareerPage();
  //     case 'Food & Nutrition':
  //       return FoodPage();
  //     case 'Fun & Entertainment':
  //       return FunPage();
  //     case 'Code':
  //       return CodePage();
  //     case 'Travel':
  //       return TravelPage();
  //     case 'Creative':
  //       return CreativePage();
  //     case 'Content':
  //       return ContentPage();
  //     default:
  //       return Container();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xFF141A30),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 125),
            Padding(padding: EdgeInsets.only(left: 13),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildSectionButton('All'),
                    SizedBox(width: 12),
                    buildSectionButton('Social'),
                    SizedBox(width: 12),
                    buildSectionButton('Education'),
                    SizedBox(width: 12),
                    buildSectionButton('Career & Business'),
                    SizedBox(width: 12),
                    buildSectionButton('Food & Nutrition'),
                    SizedBox(width: 12),
                    buildSectionButton('Code'),
                    SizedBox(width: 12),
                    buildSectionButton('Fun & Entertainment'),
                    SizedBox(width: 12),
                    buildSectionButton('Travel'),
                    SizedBox(width: 12),
                    buildSectionButton('Creative'),
                    SizedBox(width: 12),
                    buildSectionButton('Content'),
                  ],
                ),
              ),),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                height: 100,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: const Color(0xFF1467F4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Image(image: AssetImage('assets/images/chatbot.png')),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Try ChatGPT Premium',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Tap to claim your offer now',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            // SizedBox(height: 12,),
            // Expanded(
            //   child: buildSection(activeSection), // Display the content based on activeSection
            // ),
          ],
        ),
      ),
    );
  }
}

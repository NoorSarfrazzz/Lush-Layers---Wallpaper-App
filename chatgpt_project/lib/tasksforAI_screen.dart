import 'dart:math';

import 'package:flutter/material.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  String activeSection = 'All';

  final List<String> titles1 = [
    'Blog',
    'Tweet',
    'LinkedIn Post',
    'Youtube Script',
    'Profile Bio',
    'Hashtag',
    'SEO Meta Description',
  ];

  final List<String> descriptions1 = [
    'Ask AI to write content for your blog.',
    'Ask AI to write content for your tweets.',
    'Ask AI to write content for your LinkedIn Post.',
    'Ask AI to write content for your Youtube Script.',
    'Ask AI to write content for your Profile Bio.',
    'Ask AI to write content for your Hashtag.',
    'Ask AI to write content for your SEO Meta Description.',

  ];

  final List<String> imagePaths1 = [
    'assets/images/Blog.png',
    'assets/images/Tweet.png',
    'assets/images/LinkedIn Post.png',
    'assets/images/YouTube Script.png',
    'assets/images/Profile Bio.png',
    'assets/images/Hashtags.png',
    'assets/images/SEO Meta Description.png',
  ];

  final List<String> titles2 = [
    'Improve Text',
    'Text Translator',
    'Check Grammar',
    'Math Teacher',
    'General Knowledge',
    'Write an essay',
    'Research Paper',
    'Course Outline',
    'History',
    'Oratory',
    'Create Diagram',
  ];

  final List<String> descriptions2 = [
    'Ask AI to improve your text.',
    'Ask AI to translate your text in any language.',
    'Ask AI to check grammar mistakes in your text',
    'Get solve your maths problem with AI ',
    'Get an answer to any question from AI',
    'Ask AI to write an essay on any topic.',
    'Create research paper on any topic with AI',
    'Create course outline on any topic from AI ',
    'Get history on any country of any year',
    'Get content for debate and speech on any topic with AI',
    'Ask AI to create diagrams for you',
  ];

  final List<String> imagePaths2 = [
    'assets/images/Improve Text.png',
    'assets/images/Text Translator.png',
    'assets/images/Check Grammar.png',
    'assets/images/Math Teacher.png',
    'assets/images/General Knowledge.png',
    'assets/images/Write An Essay.png',
    'assets/images/Research Paper.png',
    'assets/images/Course Outline.png',
    'assets/images/History.png',
    'assets/images/Oratory.png',
    'assets/images/Create Diagram.png',
  ];

  final List<String> titles3 = [
    'Brand Name',
    'Email Writer',
    'Cover Letter ',
    'Interview Questions',
    'Weekly Reports',
    'Job Ads',
    'Slogan',
    'Competitor Analysis',
    'News Letter',
  ];

  final List<String> descriptions3 = [
    'Get unique brand names for your business.',
    'Write Essay on any topic with AI',
    'Ask AI to write professional cover letter.',
    'Get Interview questions for your business.',
    'Create weekly report for your business',
    'Get professional content for your job ad',
    'Get unique slogan for your brand.',
    'AI will help you know your competitors.',
    'Ask AI to create a news letter for your business.',
  ];

  final List<String> imagePaths3 = [
    'assets/images/Brand Name.png',
    'assets/images/Email Writer.png',
    'assets/images/Cover Letter.png',
    'assets/images/Interview Questions.png',
    'assets/images/Weekly Report.png',
    'assets/images/Job Ads.png',
    'assets/images/Slogan.png',
    'assets/images/Competitor Analysis.png',
    'assets/images/News Letter.png',
  ];

  final List<String> titles4 = [
    'Personal Training Plan',
    'Diet Plan',
    'Calories Burn',
    'Calories Calculator',
    'Mental Counselor',
    'Food Recipes',
    'Food Ingredients',
  ];

  final List<String> descriptions4 = [
    'Get your personal training program.',
    'Create your diet plan with AI',
    'Ask AI How to burn your calories',
    'Calculate Calories of your food',
    'AI will help you in your mental health',
    'Get Recipe of any food you want to cook',
    'Get Ingredients of any recipe you want to cook',
  ];

  final List<String> imagePaths4 = [
    'assets/images/Personal Training Plan.png',
    'assets/images/Diet Plan.png',
    'assets/images/Calories Burn.png',
    'assets/images/Calories Calculator.png',
    'assets/images/Mental Counselor.png',
    'assets/images/Food Recipe.png',
    'assets/images/Food Ingredients.png',
  ];

  final List<String> titles5 = [
    'Write Code',
    'Code Explainer',
    'Code Transpiler',
  ];

  final List<String> descriptions5 = [
    'Ask AI to write code in any programming language.',
    'Ask AI to explain your code.',
    'Ask AI to convert your code to other languages.',
  ];

  final List<String> imagePaths5 = [
    'assets/images/Write Code.png',
    'assets/images/Code Explainer.png',
    'assets/images/Code Transpiler.png',
  ];

  final List<String> titles6 = [
    'Travel Guide',
    'Famous Place',
    'Vacation Planner',
    'Find a Hotel',
  ];

  final List<String> descriptions6 = [
    'Get all information of your destination.',
    'AI will tell you famous places of your destination.',
    'Ask AI to be your vacation planner',
    'AI will help you to find the best hotel to stay',
  ];

  final List<String> imagePaths6 = [
    'assets/images/Travel Guide.png',
    'assets/images/Famous Place.png',
    'assets/images/Vacation Planer.png',
    'assets/images/Find a Hotel.png',
  ];

  final List<String> titles7 = [
    'Write a Song',
    'Write a Poem',
    'Write Music Notes',
    'Invitation',
    'Story Teller',
  ];

  final List<String> descriptions7 = [
    'Ask AI to write a song on any topic.',
    'Ask AI to write a poem on any topic.',
    'Ask AI to write Music Notes for you.',
    'Get content for invitation for any event',
    'Ask AI to write story on any topic',
  ];

  final List<String> imagePaths7 = [
    'assets/images/Write a Song.png',
    'assets/images/Write a Poem.png',
    'assets/images/Write Music notes.png',
    'assets/images/Invitation.png',
    'assets/images/Story Teller.png',
  ];

  final List<String> titles8 = [
    'Summarize Text',
    'Rephrasing',
    'Write a Paragraph',
    'Article Writer',
    'Keyword Generator',
    'Link Summarizer',
    'Content Calendar',
  ];

  final List<String> descriptions8 = [
    'Ask AI to summarize your text',
    'Ask AI to rephrase your text.',
    'Ask AI to write paragraph on any topic',
    'Ask AI to write article on any topic',
    'Ask AI to write trending keywords for your content',
    'Add link, AI will give you its all information',
    'Add your link and AI will make content calender',
  ];

  final List<String> imagePaths8 = [
    'assets/images/Summarize Text.png',
    'assets/images/Rephrasing.png',
    'assets/images/Write Paragraph.png',
    'assets/images/Article Writer.png',
    'assets/images/Keyword Generator.png',
    'assets/images/Link Summarizer.png',
    'assets/images/Content Calendar.png',
  ];

  final List<String> titles9 = [
    'Write a Joke',
    'Write a Riddle',
    'Movies Critic',
    'Song Recommender',
    'Drunk Buddy',
    'Daily Horoscope',
    'Birth Chart Astrology',
    'Dream Interpretation',
  ];

  final List<String> descriptions9 = [
    'Ask AI to write a joke for you.',
    'Ask AI to write a riddle for you.',
    'AI will give you honest reviews without spoilers.',
    'Write your favourite song,AI will recommend you more.',
    'Want a drunk buddy, AI will help you in that',
    'AI will tell your daily horoscope',
    'Tell your DOB, AI will tell your Zodiac Information',
    'Ask AI your dream Interpretation',
  ];

  final List<String> imagePaths9 = [
    'assets/images/Summarize Text.png',
    'assets/images/Rephrasing.png',
    'assets/images/Write Paragraph.png',
    'assets/images/Article Writer.png',
    'assets/images/Keyword Generator.png',
    'assets/images/Link Summarizer.png',
    'assets/images/Content Calendar.png',
  ];

  List<Map<String, String>> combinedData = [];

  @override
  void initState() {
    super.initState();
    combineAndShuffleData();
  }

  void combineAndShuffleData() {
    combinedData = [];

    // Create a list of all title, description, and image path lists
    List<List<String>> titles = [titles1, titles2, titles3, titles4, titles5, titles6, titles7, titles8, titles9];
    List<List<String>> descriptions = [descriptions1, descriptions2, descriptions3, descriptions4, descriptions5, descriptions6, descriptions7, descriptions8, descriptions9];
    List<List<String>> imagePaths = [imagePaths1, imagePaths2, imagePaths3, imagePaths4, imagePaths5, imagePaths6, imagePaths7, imagePaths8, imagePaths9];

    // Find the maximum length of all lists
    int maxLength = 0;
    for (var list in titles) {
      if (list.length > maxLength) {
        maxLength = list.length;
      }
    }

    // Combine data from all lists
    for (int i = 0; i < maxLength; i++) {
      for (int j = 0; j < titles.length; j++) {
        if (i < titles[j].length && i < descriptions[j].length && i < imagePaths[j].length) { // Check if the index is valid for all lists
          combinedData.add({
            'title': titles[j][i],
            'description': descriptions[j][i],
            'imagePath': imagePaths[j][i],
          });
        }
      }
    }

    // Shuffle the combined data
    combinedData.shuffle(Random());
  }

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

  Widget buildSection(String sectionName) {
    switch (sectionName) {
      case 'All':
        return AllPage();
      case 'Social':
        return SocialPage();
      case 'Education':
        return EducationPage();
      case 'Career & Business':
        return CareerPage();
      case 'Food & Nutrition':
        return FoodPage();
      case 'Fun & Entertainment':
        return FunPage();
        case 'Code':
        return CodePage();
        case 'Travel':
        return TravelPage();
      case 'Creative':
        return CreativePage();
      case 'Content':
        return ContentPage();
      default:
        return Container();
    }
  }

  Widget AllPage() {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 13.0,
        mainAxisSpacing: 15.0,
      ),
      itemCount: combinedData.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // Handle on tap
          },
          child: GridTile(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF242E49),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          child: Image.asset(
                            combinedData[index]['imagePath']!,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            // Handle bookmark press
                          },
                          icon: Icon(Icons.bookmark_border, color: Colors.white, size: 30),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      combinedData[index]['title']!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          combinedData[index]['description']!,
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget SocialPage() {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 13.0,
        mainAxisSpacing: 15.0,
      ),
      itemCount: imagePaths1.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // Handle on tap
          },
          child: GridTile(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF242E49),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          child: Image(
                            image: AssetImage(imagePaths1[index]),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            // Handle bookmark press
                          },
                          icon: Icon(Icons.bookmark_border, color: Colors.white,size: 30,),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      titles1[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          descriptions1[index],
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget EducationPage() {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 13.0,
        mainAxisSpacing: 15.0,
      ),
      itemCount: imagePaths2.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // Handle on tap
          },
          child: GridTile(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF242E49),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          child: Image(
                            image: AssetImage(imagePaths2[index]),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            // Handle bookmark press
                          },
                          icon: Icon(Icons.bookmark_border, color: Colors.white,size: 30,),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      titles2[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          descriptions2[index],
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget CareerPage() {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 13.0,
        mainAxisSpacing: 15.0,
      ),
      itemCount: imagePaths3.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // Handle on tap
          },
          child: GridTile(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF242E49),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          child: Image(
                            image: AssetImage(imagePaths3[index]),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            // Handle bookmark press
                          },
                          icon: Icon(Icons.bookmark_border, color: Colors.white,size: 30,),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      titles3[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          descriptions3[index],
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget FoodPage() {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 13.0,
        mainAxisSpacing: 15.0,
      ),
      itemCount: imagePaths4.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // Handle on tap
          },
          child: GridTile(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF242E49),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          child: Image(
                            image: AssetImage(imagePaths4[index]),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            // Handle bookmark press
                          },
                          icon: Icon(Icons.bookmark_border, color: Colors.white,size: 30,),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      titles4[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          descriptions4[index],
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget CodePage() {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 13.0,
        mainAxisSpacing: 15.0,
      ),
      itemCount: imagePaths5.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // Handle on tap
          },
          child: GridTile(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF242E49),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          child: Image(
                            image: AssetImage(imagePaths5[index]),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            // Handle bookmark press
                          },
                          icon: Icon(Icons.bookmark_border, color: Colors.white,size: 30,),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      titles5[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          descriptions5[index],
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget TravelPage() {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 13.0,
        mainAxisSpacing: 15.0,
      ),
      itemCount: imagePaths6.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // Handle on tap
          },
          child: GridTile(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF242E49),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          child: Image(
                            image: AssetImage(imagePaths6[index]),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            // Handle bookmark press
                          },
                          icon: Icon(Icons.bookmark_border, color: Colors.white,size: 30,),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      titles6[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          descriptions6[index],
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget CreativePage() {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 13.0,
        mainAxisSpacing: 15.0,
      ),
      itemCount: imagePaths7.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // Handle on tap
          },
          child: GridTile(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF242E49),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          child: Image(
                            image: AssetImage(imagePaths7[index]),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            // Handle bookmark press
                          },
                          icon: Icon(Icons.bookmark_border, color: Colors.white,size: 30,),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      titles7[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          descriptions7[index],
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget ContentPage() {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 13.0,
        mainAxisSpacing: 15.0,
      ),
      itemCount: imagePaths8.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // Handle on tap
          },
          child: GridTile(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF242E49),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          child: Image(
                            image: AssetImage(imagePaths8[index]),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            // Handle bookmark press
                          },
                          icon: Icon(Icons.bookmark_border, color: Colors.white,size: 30,),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      titles8[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          descriptions8[index],
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget FunPage() {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 13.0,
        mainAxisSpacing: 15.0,
      ),
      itemCount: imagePaths9.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // Handle on tap
          },
          child: GridTile(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF242E49),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          child: Image(
                            image: AssetImage(imagePaths9[index]),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            // Handle bookmark press
                          },
                          icon: Icon(Icons.bookmark_border, color: Colors.white,size: 30,),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      titles9[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          descriptions9[index],
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xFF141A30) ,
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
            SizedBox(height: 12,),
            Expanded(
              child: buildSection(activeSection), // Display the content based on activeSection
            ),
          ],
        ),
      ),
    );
  }
}

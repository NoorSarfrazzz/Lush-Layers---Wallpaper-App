import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<String> titles = [
    'Image Generator',
    'Creative',
    'Study',
    'Internet',
    'Summary',
    'Social',
    'Promotion',
    'Writing',
    'Health',
  ];

  final List<String> descriptions = [
    'This is an AI image generator. It creates an image from scratch from a text description.',
    'Compose lyrics in the style of The Beatles.',
    'Explain a theorem to me.',
    'Write a video script.',
    'Summarize text from photos.',
    'Create an engaging post.',
    'Draft an email.',
    'Craft an essay.',
    'Create a training and meal plan.',
  ];

  final List<String> imagePaths = [
    'assets/images/Image  Generator.png',
    'assets/images/Creative.png',
    'assets/images/Study.png',
    'assets/images/Internet.png',
    'assets/images/Summary.png',
    'assets/images/Social.png',
    'assets/images/Promotion.png',
    'assets/images/Writing.png',
    'assets/images/Health.png',
  ];

  final List<String> cardTitles = [
    'Give me a step-by-step plan to get rich?',
    'How can I get a promotion?',
    'Tell me a joke',
    'Create a one-page essay on The Great Gatsby',
    'How many hours of sleep does an average person need?',
    'What is the meaning of life?',
    'Let\'s play Word Ladder. You go first',
  ];

  final List<String> trailingImagePaths = [
    'assets/images/Ask for Advice 1.png',
    'assets/images/Promotion.png',
    'assets/images/Have Fum.png',
    'assets/images/Write & Edit.png',
    'assets/images/Improvw Health.png',
    'assets/images/Talk Philosophy.png',
    'assets/images/Play Games.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141A30) ,
      extendBody: true,
      appBar: null,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 140),
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
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: const Text(
                'Get help with any task',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                children: [
                  Container(
                    height: 160.0, // First row height
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: (titles.length >= 4) ? 4 : titles.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: index == 0 ? 280.0 : 170.0,
                          margin: const EdgeInsets.all(8),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                          decoration: BoxDecoration(
                            color: const Color(0xFF242E49),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset(imagePaths[index], height: 42),
                                  const SizedBox(width: 15),
                                  Expanded(
                                    child: Text(
                                      titles[index],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text(
                                descriptions[index],
                                style: const TextStyle(
                                  color: Colors.white38,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    height: 160.0, // Second row height
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: (titles.length > 4) ? titles.length - 4 : 0,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 170.0,
                          margin: const EdgeInsets.all(8.0),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                          decoration: BoxDecoration(
                            color: const Color(0xFF242E49),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset(imagePaths[index + 4], height: 42),
                                  const SizedBox(width: 15),
                                  Expanded(
                                    child: Text(
                                      titles[index + 4],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text(
                                descriptions[index + 4],
                                style: const TextStyle(
                                  color: Colors.white38,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Color(0xFF1467F4), width: 2),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: TextFormField(
                                onTap: () {},
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: 'Type your message here...',
                                  hintStyle: const TextStyle(fontSize: 15, color: Colors.white),
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.qr_code_scanner_sharp, color: Colors.white,size: 28,),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 51,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1467F4),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.mic_none_outlined, color: Colors.white, size: 30,),
                    ),
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 12),
            //   child: ListView.builder(
            //     shrinkWrap: true,
            //     physics: const NeverScrollableScrollPhysics(),
            //     itemCount: cardTitles.length,
            //     itemBuilder: (context, index) {
            //       return Card(
            //         color: const Color(0xFF141A30),
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(12),
            //         ),
            //         child: ListTile(
            //           title: Text(
            //               cardTitles[index],
            //               style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
            //             ),
            //           trailing: Image.asset(trailingImagePaths[index], height: 42),
            //         ),
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

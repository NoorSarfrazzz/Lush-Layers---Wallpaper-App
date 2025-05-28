import 'package:flutter/material.dart';

class PricingScreen extends StatefulWidget {
  const PricingScreen({super.key});

  @override
  State<PricingScreen> createState() => _PricingScreenState();
}

class _PricingScreenState extends State<PricingScreen> {
  ScrollController _scrollController = ScrollController();
  bool _isSwitchOn1 = false;

  final List<Map<String, String>> items = [
    {
      'title': 'Powered By',
      'description': 'GPT-3.5',
      'image': 'assets/images/Powered By.png'
    },
    {
      'title': 'UNLIMITIED',
      'description': 'Chat Messages',
      'image': 'assets/images/UNLIMITED.png'
    },
    {
      'title': 'Powered By',
      'description': 'GPT-3.5',
      'image': 'assets/images/Group 445.png'
    },
    {
      'title': 'More Detailed',
      'description': 'Answers',
      'image': 'assets/images/More Detailed.png'
    },
  ];

  @override
  void initState() {
    super.initState();
    //_startAutoScroll();
  }

  void _startAutoScroll() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(seconds: 10),
        curve: Curves.linear,
      ).then((_) {
        _scrollController.jumpTo(0);
        _startAutoScroll();
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  bool _isTapped = false;

  void _toggleIconColor() {
    setState(() {
      _isTapped = !_isTapped;
    });
  }

  bool _isTapped1 = false;

  void _toggleIconColor1() {
    setState(() {
      _isTapped1 = !_isTapped1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF141A30),
      appBar: null,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 410,
                width: double.infinity,
                child: Image.asset('assets/images/pricing.png', fit: BoxFit.cover),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 290,),
                  Container(
                    height: 122,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF141A30).withOpacity(0),
                          Color(0xFF141A30).withOpacity(0.7),
                          Color(0xFF141A30).withOpacity(0.9),
                          Color(0xFF141A30),
                          Color(0xFF141A30),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Upgrade to ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xFF1467F4),
                          ),
                          child: Text(
                            'PRO',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 85,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: _scrollController,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 180,
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          margin: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Image.asset(
                                items[index]['image']!,
                                height: 40,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(width: 10),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    items[index]['title']!,
                                    style: TextStyle(color: Colors.white, fontSize: 13),
                                  ),
                                  SizedBox(height: 7),
                                  Text(
                                    items[index]['description']!,
                                    style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 5,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 12),
                    padding: EdgeInsets.symmetric(horizontal: 12,vertical: 5),
                    decoration: BoxDecoration(
                      color: Color(0xFF242E49),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Free trial enabled',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 16),),
                        Switch(
                          value: _isSwitchOn1,
                          onChanged: (value) {
                            setState(() {
                              _isSwitchOn1 = value;
                            });
                          },
                          activeTrackColor: Color(0xFF141A30), // Active border color
                          activeColor: Color(0xFF1467F4), // Active circle color
                          inactiveThumbColor: Colors.white54, // Inactive circle color
                          inactiveTrackColor: Colors.white54, // Inactive border color
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 7,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 12),
                    padding: EdgeInsets.symmetric(horizontal: 12,vertical: 5),
                    decoration: BoxDecoration(
                      color: Color(0xFF242E49),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('YEARLY ACCESS',style: TextStyle(fontSize: 15,color: Colors.white),),
                            Text('Rs 9100.00/year',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.white),),
                          ],
                        ),
                        IconButton(onPressed: (){_toggleIconColor1();}, icon: Icon(Icons.check_circle_sharp,color: _isTapped1 ? Color(0xFF1467F4) : Colors.white,size: 28,))
                      ],
                    ),
                  ),
                  SizedBox(height: 7,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 12),
                    padding: EdgeInsets.symmetric(horizontal: 12,vertical: 5),
                    decoration: BoxDecoration(
                      color: Color(0xFF242E49),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('3-DAY FREE TRIAL',style: TextStyle(fontSize: 15,color: Colors.white),),
                            Text('then Rs2000.00/year',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.white),),
                          ],
                        ),
                        IconButton(onPressed: (){_toggleIconColor();}, icon: Icon(Icons.check_circle_sharp,color: _isTapped ? Color(0xFF1467F4) : Colors.white,size: 28,))
                      ],
                    ),
                  ),
                  SizedBox(height: 13,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 12),
                    width: double.infinity, // Full width
                    child: ElevatedButton(
                      onPressed: () {
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15.0), // Adjust vertical padding as needed
                        backgroundColor: Color(0xFF1467F4), // Button color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0), // Button border radius
                        ),
                      ),
                      child: Text(
                        'Try for Free',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

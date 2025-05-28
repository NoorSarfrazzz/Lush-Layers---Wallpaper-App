import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final List<String> imageUrls = [
  'https://images.pexels.com/photos/3772630/pexels-photo-3772630.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/27177683/pexels-photo-27177683/free-photo-of-high-angle-view-of-dog.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/18818480/pexels-photo-18818480/free-photo-of-modern-abstract-painting.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/23729952/pexels-photo-23729952/free-photo-of-a-pensive-man-holding-a-small-lantern-with-a-candle-in-the-forest.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/1002638/pexels-photo-1002638.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/208147/pexels-photo-208147.jpeg?auto=compress&cs=tinysrgb&w=600',
  ];

  final List<String> imageNames = [
    'Nature\'s Wonders',
    'Urban Oasis',
    'Abstract Dreams',
    'Fantasy Realms',
    'Retro Revival',
    'Mood and Emotions',
  ];

  final List<String> imageUrls1 = [
  'https://images.pexels.com/photos/1312488/pexels-photo-1312488.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/6858608/pexels-photo-6858608.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/4915833/pexels-photo-4915833.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/6402533/pexels-photo-6402533.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/6045257/pexels-photo-6045257.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/6402529/pexels-photo-6402529.jpeg?auto=compress&cs=tinysrgb&w=600',
  ];

  final List<String> imageNames1 = [
    'Blue',
    'Green',
    'Yellow',
    'Orange',
    'Red',
    'Purple',
  ];

  final List<String> imageUrls2 = [
  'https://images.pexels.com/photos/2449605/pexels-photo-2449605.png?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/1209843/pexels-photo-1209843.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/618833/pexels-photo-618833.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/3225517/pexels-photo-3225517.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/921294/pexels-photo-921294.png?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/187041/pexels-photo-187041.jpeg?auto=compress&cs=tinysrgb&w=600',
  ];

  final List<String> imageNames2 = [
    'Dark',
    'Colorful',
    'Mountains',
    'Nature',
    'Light',
    'Stock',
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9),
      appBar: null,
      body: SingleChildScrollView(
      child : Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20,),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 0),
          child : RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            children: [
              TextSpan(
                text: 'Browse by ',
                style: TextStyle(
                  color: Colors.yellow.shade400,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text: 'Category',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),

            ],
          ),
        ),),
        SizedBox(height: 10,),
      Container(
        height: 270,
        child : GridView.builder(
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 0.74,
        ),
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child: Stack(
              children: [
                Container(
                  height: 230,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(imageUrls[index]),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: 230,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      imageNames[index],
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          );
        },
      ),
      ),


        Container(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 0),
          child : RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              children: [
                TextSpan(
                  text: 'Browse by ',
                  style: TextStyle(
                    color: Colors.greenAccent.shade400,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: 'Colors',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),

              ],
            ),
          ),),
        SizedBox(height: 10,),
        Container(
          height: 160,
          child : GridView.builder(
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 0.97,
            ),
            itemCount: imageUrls1.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                child: Stack(
                  children: [
                    Container(
                      height: 160,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(imageUrls1[index]),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Container(
                      height: 160,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          imageNames1[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(height: 20,),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 0),
          child : RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              children: [
                TextSpan(
                  text: 'Browse by ',
                  style: TextStyle(
                    color: Colors.yellow.shade400,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: 'Tags',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),

              ],
            ),
          ),),
        SizedBox(height: 15,),
        Container(
          height: 160,
          child : GridView.builder(
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 0.8,
            ),
            itemCount: imageUrls2.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                child: Stack(
                  children: [
                    Container(
                      height: 160,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(imageUrls2[index]),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Container(
                      height: 160,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          imageNames2[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  bool _isSwitchOn1 = false;
  bool _isSwitchOn2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Color(0xFF141A30),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        backgroundColor: Color(0xFF242E49),
        flexibleSpace: Stack(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.white10),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      icon: Icon(
                        Icons.arrow_back_ios_outlined,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 16),
                    Text(
                      'Settings',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
      child : Padding(
        padding: EdgeInsets.symmetric(horizontal: 12,vertical: 13),
        child: Column(
          children: [
            SizedBox(height: 5,),
            GestureDetector(
              onTap: (){},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
                decoration: BoxDecoration(
                  color: Color(0xFF242E49),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('What\'s New?',style: TextStyle(color: Colors.white,fontSize: 15),),
                    Stack(
                      children: [
                        Icon(
                          Icons.notifications_none,
                          color: Colors.white,
                          size: 30, // Adjust the size as needed
                        ),
                        Positioned(
                          right: 03,
                          top: 1.2,
                          child: Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              color: Colors.yellow.shade600,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              padding:EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Color(0xFF242E49),
                borderRadius: BorderRadius.circular(12),
              ),
              child:  Column(
                children: [
                  SizedBox(height: 5,),
                  Padding(padding:EdgeInsets.symmetric(horizontal: 12),
                    child : GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LanguageScreen()),);
                      },
                    child : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Language',style: TextStyle(color: Colors.white,fontSize: 15),),
                      Text('System language',style: TextStyle(color: Colors.white54,fontSize: 15),),
                  ],),),),
                  SizedBox(height: 8,),
                  Divider(color: Color(0xFF141A30),thickness: 1.5,),
                  SizedBox(height: 5,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Haptic feedback',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
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

                  SizedBox(height: 8,),
                  Divider(color: Color(0xFF141A30),thickness: 1.5,),
                  SizedBox(height: 5,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Follow-up Questions',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        Switch(
                          value: _isSwitchOn2,
                          onChanged: (value) {
                            setState(() {
                              _isSwitchOn2 = value;
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
                  SizedBox(height: 8,),
                  Divider(color: Color(0xFF141A30),thickness: 1.5,),
                  SizedBox(height: 5,),
                  Padding(padding:EdgeInsets.symmetric(horizontal: 12),
                    child : Text('Keep your chats going and delve deeper into any topic.',style: TextStyle(color: Colors.white54,fontSize: 14),),),
                  SizedBox(height: 8,),
                ],
              ),
            ),
            SizedBox(height: 12,),
            Container(
              padding:EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Color(0xFF242E49),
                borderRadius: BorderRadius.circular(12),
              ),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5,),
                  Padding(padding:EdgeInsets.symmetric(horizontal: 12),
                    child : Text('Manage Subscription',style: TextStyle(color: Colors.white,fontSize: 15),),),
                  SizedBox(height: 8,),
                  Divider(color: Color(0xFF141A30),thickness: 1.5,),
                  SizedBox(height: 5,),
                  Padding(padding:EdgeInsets.symmetric(horizontal: 12),
                    child : Text('Terms of Use',style: TextStyle(color: Colors.white,fontSize: 15),),),
                  SizedBox(height: 8,),
                  Divider(color: Color(0xFF141A30),thickness: 1.5,),
                  SizedBox(height: 5,),
                  Padding(padding:EdgeInsets.symmetric(horizontal: 12),
                    child : Text('Privacy Policy',style: TextStyle(color: Colors.white,fontSize: 15),),),
                  SizedBox(height: 8,),
                  Divider(color: Color(0xFF141A30),thickness: 1.5,),
                  SizedBox(height: 5,),
                  Padding(padding:EdgeInsets.symmetric(horizontal: 12),
                    child : Text('Contact us',style: TextStyle(color: Colors.white,fontSize: 15),),),
                  SizedBox(height: 8,),
                  Divider(color: Color(0xFF141A30),thickness: 1.5,),
                  SizedBox(height: 5,),
                  Padding(padding:EdgeInsets.symmetric(horizontal: 12),
                    child : Text('Rate us',style: TextStyle(color: Colors.white,fontSize: 15),),),
                  SizedBox(height: 8,),
                ],
              ),
            ),
            SizedBox(height: 12,),
            Padding(padding: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child : Text('Follow US',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),),),
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
              child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xFF242E49),
                        ),
                      child: Image.asset('assets/images/Instagrame.png'),
                    ),
                    SizedBox(height: 5,),
                    Text('Instagram',style: TextStyle(color: Colors.white38),),
                  ],
                ),
                SizedBox(width: 8,),
                Column(
                  children: [
                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xFF242E49),
                      ),
                      child: Image.asset('assets/images/X.png'),
                    ),
                    SizedBox(height: 5,),
                    Text('X',style: TextStyle(color: Colors.white38),),
                  ],
                ),
                SizedBox(width: 10,),
                Column(
                  children: [
                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xFF242E49),
                      ),
                      child: Image.asset('assets/images/TikTok.png'),
                    ),
                    SizedBox(height: 5,),
                    Text('Tiktok',style: TextStyle(color: Colors.white38),),
                  ],
                ),
                SizedBox(width: 10,),
                Column(
                  children: [
                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xFF242E49),
                      ),
                      child: Image.asset('assets/images/LinkedIn.png'),
                    ),
                    SizedBox(height: 5,),
                    Text('LinkedIn',style: TextStyle(color: Colors.white38),),
                  ],
                ),
                SizedBox(width: 10,),
                Column(
                  children: [
                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xFF242E49),
                      ),
                      child: Image.asset('assets/images/Youtube.png'),
                    ),
                    SizedBox(height: 5,),
                    Text('Youtube',style: TextStyle(color: Colors.white38),),
                  ],
                ),
              ],
            )),
            SizedBox(height: 14,),
          ],
        ),
      ),
      ),
    );
  }

  Widget LanguageScreen(){
    return Scaffold(
      backgroundColor: Color(0xFF141A30) ,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        backgroundColor: Color(0xFF242E49),
        flexibleSpace: Stack(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.white10),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      icon: Icon(
                        Icons.arrow_back_ios_outlined,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 16),
                    Text(
                      'Languages',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 25),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color(0xFF242E49),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('System Languages', style: TextStyle(fontSize: 15, color: Colors.white)),
                  ),
                ),
                Divider(color: Color(0xFF141A30), thickness: 1.5),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('English', style: TextStyle(fontSize: 15, color: Colors.white)),
                  ),
                ),
                Divider(color: Color(0xFF141A30), thickness: 1.5),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Spanish', style: TextStyle(fontSize: 15, color: Colors.white)),
                  ),
                ),
                Divider(color: Color(0xFF141A30), thickness: 1.5),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('French', style: TextStyle(fontSize: 15, color: Colors.white)),
                  ),
                ),
                Divider(color: Color(0xFF141A30), thickness: 1.5),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('German', style: TextStyle(fontSize: 15, color: Colors.white)),
                  ),
                ),
                Divider(color: Color(0xFF141A30), thickness: 1.5),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Chinese', style: TextStyle(fontSize: 15, color: Colors.white)),
                  ),
                ),
                Divider(color: Color(0xFF141A30), thickness: 1.5),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Japanese', style: TextStyle(fontSize: 15, color: Colors.white)),
                  ),
                ),
                Divider(color: Color(0xFF141A30), thickness: 1.5),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Russian', style: TextStyle(fontSize: 15, color: Colors.white)),
                  ),
                ),
                Divider(color: Color(0xFF141A30), thickness: 1.5),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Portuguese', style: TextStyle(fontSize: 15, color: Colors.white)),
                  ),
                ),
                Divider(color: Color(0xFF141A30), thickness: 1.5),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Hindi', style: TextStyle(fontSize: 15, color: Colors.white)),
                  ),
                ),
                Divider(color: Color(0xFF141A30), thickness: 1.5),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Arabic', style: TextStyle(fontSize: 15, color: Colors.white)),
                  ),
                ),
                Divider(color: Color(0xFF141A30), thickness: 1.5),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Italian', style: TextStyle(fontSize: 15, color: Colors.white)),
                  ),
                ),
                Divider(color: Color(0xFF141A30), thickness: 1.5),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Korean', style: TextStyle(fontSize: 15, color: Colors.white)),
                  ),
                ),
                Divider(color: Color(0xFF141A30), thickness: 1.5),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Turkish', style: TextStyle(fontSize: 15, color: Colors.white)),
                  ),
                ),
                Divider(color: Color(0xFF141A30), thickness: 1.5),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Dutch', style: TextStyle(fontSize: 15, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}

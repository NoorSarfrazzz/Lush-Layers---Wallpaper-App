import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Favourites_screen.dart';
import 'package:untitled/community_screen.dart';
import 'package:untitled/explore_page.dart';
import 'package:untitled/login_screen.dart';
import 'package:untitled/signout_screen.dart';
import 'package:flutter/material.dart';
import 'package:untitled/signup_screen.dart';

class MyAppBar extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithProfile(),
      // drawer: DrawerWidget(),
    );
  }
}

class AppBarWithProfile extends StatefulWidget implements PreferredSizeWidget {
  const AppBarWithProfile({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  _AppBarWithProfileState createState() => _AppBarWithProfileState();
}

class _AppBarWithProfileState extends State<AppBarWithProfile> {

  bool isAuthenticated = false;
  String? finalEmail;
  List<String> favorites = [];

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
    getValidationData();
    loadFavorites();
  }

  Future<void> checkLoginStatus() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      isAuthenticated = sharedPreferences.getBool('isAuthenticated') ?? false;
    });
  }

  Future<void> loadFavorites() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      favorites = sharedPreferences.getStringList('favorites') ?? [];
    });
  }

  Future<void> getValidationData() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var obtainedEmail = sharedPreferences.getString('email');
    setState(() {
      finalEmail = obtainedEmail;
    });
  }

  void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            "Are you sure you want to logout?",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          content: Text("Remember, you have to login again to continue using the app."),
          actions: <Widget>[
            TextButton(
              child: Text("Cancel", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Logout", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
              onPressed: () async {
                final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                await sharedPreferences.setBool('isAuthenticated', false); // Set authentication status to false
                await sharedPreferences.remove('email'); // Clear all shared preferences
                await sharedPreferences.remove('favorites');

                // Clear favorites from provider
                Provider.of<FavoriteProvider>(context, listen: false).clearFavorites();

                // Close the dialog first
                Navigator.of(context).pop();

                // Ensure correct context and navigation
                Get.offAll(() => SignoutLoadingScreen()); // Use Get.offAll to remove all previous routes and navigate to the login screen

                // Update the state
                setState(() {
                  isAuthenticated = false;
                  finalEmail = null;
                  favorites = [];
                });
              },
            ),
          ],
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
        leading: IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DrawerWidget()),
          );
        },
          icon: Icon(
            isAuthenticated ? Icons.account_circle : Icons.account_circle_outlined,
            color: isAuthenticated ? Colors.yellow.shade600 : Colors.white,
            size: 35,
          ),
        ),
      centerTitle: true,
      title: Row(
        children: [
          Expanded(
            child: isAuthenticated
                ? RichText(
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                children: [
                  TextSpan(
                    text: 'Welcome to ',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: 'Lush',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.greenAccent.shade400,
                    ),
                  ),
                  TextSpan(
                    text: 'Layers',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.yellow.shade600,
                    ),
                  ),
                ],
              ),
            )
                : RichText(
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                children: [
                  TextSpan(
                    text: 'Lush',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.greenAccent.shade400,
                    ),
                  ),
                  TextSpan(
                    text: 'Layers',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.yellow.shade600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          PopupMenuButton(
            icon: Icon(Icons.more_vert, color: isAuthenticated ? Colors.green : Colors.white),
            offset: Offset(-5, 50),
            color: Colors.white,
            itemBuilder: (BuildContext context) => isAuthenticated
                ? [
              PopupMenuItem(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.logout, color: Colors.black),
                    SizedBox(width: 10),
                    Text(
                      'Logout',
                      style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                value: 'logout',
              ),
            ]
                : [
              PopupMenuItem(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.login, color: Colors.black),
                    SizedBox(width: 10),
                    Text(
                      'Login',
                      style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                value: 'login',
              ),
              PopupMenuItem(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.person_add, color: Colors.black),
                    SizedBox(width: 10),
                    Text(
                      'Signup',
                      style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                value: 'signup',
              ),
            ],
            onSelected: (String result) {
              // Handle menu item selection
              switch (result) {
                case 'login':
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                  break;
                case 'logout':
                  print('Logout selected');
                  showLogoutDialog(context);
                  break;
                case 'signup':
                  print('signup selected');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupScreen()),
                  );
                  break;
              }
            },
          ),
        ],
      ),
    );
  }

}


class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  bool isAuthenticated = false;
  String? finalEmail;
  List<String> favorites = [];

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
    getValidationData();
    loadFavorites();
  }

  Future<void> checkLoginStatus() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      isAuthenticated = sharedPreferences.getBool('isAuthenticated') ?? false;
    });
  }

  Future<void> loadFavorites() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      favorites = sharedPreferences.getStringList('favorites') ?? [];
    });
  }

  Future<void> getValidationData() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var obtainedEmail = sharedPreferences.getString('email');
    setState(() {
      finalEmail = obtainedEmail;
    });
  }

  void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text("Are you sure you want to logout?", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          content: Text("Remember, you have to login again to continue using the app."),
          actions: <Widget>[
            TextButton(
              child: Text("Cancel", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Logout", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
              onPressed: () async {
                final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                await sharedPreferences.setBool('isAuthenticated', false); // Set authentication status to false
                await sharedPreferences.remove('email'); // Clear all shared preferences
                await sharedPreferences.remove('favorites');

                // Clear favorites from provider
                Provider.of<FavoriteProvider>(context, listen: false).clearFavorites();

                // Ensure correct context and navigation
                Navigator.of(context).pop(); // Close the dialog first
                Get.offAll(() => SignoutLoadingScreen()); // Use Get.offAll to remove all previous routes and navigate to the login screen

                setState(() {
                  isAuthenticated = false;
                  finalEmail = null;
                  favorites = [];
                }); // Update the state
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20,),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                    child: Row(
                      children: [
                        Icon(Icons.settings_outlined, color: Colors.black),
                        SizedBox(width: 60),
                        Text(
                          'Your Profile',
                          style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.w600),
                        ),
                        Spacer(),
                        IconButton(onPressed: () {
                          Navigator.pop(context);
                        }, icon: Icon(Icons.close, color: Colors.black)),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 5),
                      ),
                      child: CircleAvatar(
                        radius: 75,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('assets/images/pic1.png'),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              color: Colors.black.withOpacity(0.8),
              child: ListView(
                children: [
                  ListTile(
                    leading: isAuthenticated? null : Icon(Icons.login, size: 30, color: Colors.blue.shade300),
                    title: isAuthenticated
                        ? Center(
                            child: Text(
                        finalEmail ?? '',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.w500,decoration: TextDecoration.underline,decorationColor: Colors.white, ),
                      ),
                    )
                        : Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    onTap: () {
                      if (!isAuthenticated) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                      }
                    },
                  ),

                  if (!isAuthenticated) Divider(color: Colors.white10),
                  if (isAuthenticated) SizedBox(height: 20,),
                  ListTile(
                    leading: Icon(
                      Icons.exit_to_app, size: 30,
                      color: Colors.green.shade400,
                    ),
                    title: Text('Logout', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500)),
                    onTap: () {
                      showLogoutDialog(context);
                    },
                  ),
                  Divider(color: Colors.white10),
                  ListTile(
                    leading: Icon(
                      Icons.public, size: 30,
                      color: Colors.blue.shade300,
                    ),
                    title: Text('Community', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500)),
                    onTap: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context)=> CommunityScreen()));
                    },
                  ),
                  Divider(color: Colors.white10),
                  ListTile(
                    leading: Icon(
                      Icons.favorite, size: 30,
                      color: Colors.red,
                    ),
                    title: Text('Favorites', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500)),
                    onTap: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context)=> FavouritesScreen()));
                    },
                  ),
                  Divider(color: Colors.white10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context)=> ExplorePage()));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 16, right: 24),
                            child: Icon(
                              Icons.explore_outlined, size: 30,
                              color: Colors.yellow,
                            ),
                          ),
                          Text(
                            'Explore',
                            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ],
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


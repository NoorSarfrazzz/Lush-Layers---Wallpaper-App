import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:provider/provider.dart';
import 'Favourites_screen.dart';
import 'firebase_auth_implementation/auth_services.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'Preview_page.dart';


class CommunityScreen extends StatefulWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  final List<String> imageUrls = [
    'https://images.pexels.com/photos/4327602/pexels-photo-4327602.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/3063362/pexels-photo-3063362.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/4207620/pexels-photo-4207620.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/4346325/pexels-photo-4346325.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/4041285/pexels-photo-4041285.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/5725894/pexels-photo-5725894.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/2088205/pexels-photo-2088205.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/4405244/pexels-photo-4405244.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/4594030/pexels-photo-4594030.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/1909331/pexels-photo-1909331.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/4175070/pexels-photo-4175070.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/4449318/pexels-photo-4449318.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/3584309/pexels-photo-3584309.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/3733925/pexels-photo-3733925.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/3993249/pexels-photo-3993249.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/4593876/pexels-photo-4593876.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/2088211/pexels-photo-2088211.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/7711099/pexels-photo-7711099.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/4466054/pexels-photo-4466054.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/4646214/pexels-photo-4646214.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/3426870/pexels-photo-3426870.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/2683373/pexels-photo-2683373.jpeg?auto=compress&cs=tinysrgb&w=600',

  ];
  final List<String> imageNames = [
    'Pure Stone',
    'Draft Plan',
    'Ember Echos',
    'For Growth',
    'Frost Dreams',
    'Echoe Path',
    'Whispers',
    'Mystic Hues',
    'Sunny Delight',
    'On the Cusp',
    'Crystal Waves',
    'Urban Escape',
    'Mystic Forest',
    'Desert Mirage',
    'Ocean Breeze',
    'Silver Linings',
    'Golden Hour',
    'Riverbank',
    'Wildflower',
    'Starlight',
    'Morning Dew',
    'Sea Spray',
    'Luminous',
    'Blooming Garden',
    'Cosmic Dreams',
    'Sunset Ridge'
  ];

  void _showModalBottomSheet() async {
    showModalBottomSheet(
      backgroundColor: Colors.blueGrey.shade900,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 190,
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Upload photo',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.yellowAccent.shade700,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () async {
                    final picker = ImagePicker();
                    try {
                      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

                      if (pickedFile != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DisplayPictureScreen(imagePath: pickedFile.path),
                          ),
                        );
                      } else {
                        print('No image selected.');
                      }
                    } catch (e) {
                      print('Error picking image: $e');
                    }
                  },
                  child: Row(
                    children: [
                      Icon(Icons.photo_album_outlined, color: Colors.white),
                      SizedBox(width: 20),
                      Text(
                        'View photo library',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () async {
                    final cameras = await availableCameras();
                    if (cameras.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CameraScreen(cameras: cameras),
                        ),
                      );
                    }
                  },
                  child: Row(
                    children: [
                      Icon(Icons.camera_alt_outlined, color: Colors.white),
                      SizedBox(width: 20),
                      Text(
                        'Take a photo',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  bool isAuthenticated = false;
  late Future<List<CameraDescription>> _camerasFuture;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
    _camerasFuture = availableCameras();
  }

  Future<void> checkLoginStatus() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      isAuthenticated = sharedPreferences.getBool('isAuthenticated') ?? false;
    });
  }


  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<FavoriteProvider>(context);

    return Consumer<AuthService>(
        builder: (context, authService, child) {
      return Scaffold(
        backgroundColor: Colors.black.withOpacity(0.9),
        appBar: null,
        body: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 13.0,
            mainAxisSpacing: 15.0,
          ),
          itemCount: imageUrls.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PreviewPage(
                      imageId: index, // Use index or another unique identifier
                      imageUrl: imageUrls[index],
                    ),
                  ),
                );
              },
              child: GridTile(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.vertical(top: Radius
                              .circular(8.0)),
                          child: CachedNetworkImage(
                            imageUrl: imageUrls[index],
                            fit: BoxFit.cover,
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                          ),
                        ),
                      ),
                      Container(
                        height: 55,
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.blueGrey.shade500,
                          borderRadius: BorderRadius.vertical(bottom: Radius
                              .circular(8.0)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                                imageNames[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            Spacer(),
                            IconButton(
                              icon: provider.isExist(imageUrls[index])
                                  ? const Icon(Icons.favorite, color: Colors.red)
                                  : const Icon(Icons.favorite_outline, color: Colors.white),
                              onPressed: () {
                                if (isAuthenticated) {
                                  provider.toggleFavorites(imageUrls[index], imageNames[index]);
                                } else {
                                  _showAlertDialog(context);
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.yellowAccent.shade700,
          onPressed: () {
            print('FAB pressed!');
            if (isAuthenticated) {
              _showModalBottomSheet();
            } else {
              _showAlertDialog1(context);
            }
          },
          tooltip: 'upload',
          child: Icon(Icons.upload_rounded, color: Colors.blueGrey.shade900,),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
    });
  }
  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Colors.blueGrey.shade900,
              contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 25),
              title: Center(child : Text(
                'Add to your Favourites?',textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20,color: Colors.yellow.shade800),
              ),),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Center(child : Text('Want to add some of content to the Favourites? Sign In to get started.',style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400),),),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.yellow.shade700),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                )
                            )
                        ),
                        child: Text('Cancel', style: TextStyle(
                            color: Colors.black),),
                      ),
                      SizedBox(width: 20),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>
                                LoginScreen()),
                          );
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.cyan.shade600),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                )
                            )
                        ),
                        child: Text('Sign In', style: TextStyle(
                            color: Colors.black),),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
  void _showAlertDialog1(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Colors.blueGrey.shade900,
              contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 25),
              title: Center(child : Text(
                'Let\'s Get Social',textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20,color: Colors.yellow.shade800),
              ),),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Center(child : Text('Want to upload some of your own content to the Community? Sign In to get started.',style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400),),),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.yellow.shade700),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                )
                            )
                        ),
                        child: Text('Cancel', style: TextStyle(
                            color: Colors.black),),
                      ),
                      SizedBox(width: 20),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>
                                LoginScreen()),
                          );
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.cyan.shade600),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                )
                            )
                        ),
                        child: Text('Sign In', style: TextStyle(
                            color: Colors.black),),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class CameraScreen extends StatefulWidget {
  final List<CameraDescription> cameras;

  CameraScreen({required this.cameras});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // Initialize the controller with the first available camera.
    _controller = CameraController(
      widget.cameras[0], // Use the first camera available
      ResolutionPreset.high,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Take a Photo',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(_controller);
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          Positioned(
            bottom: 20,
            left: MediaQuery.of(context).size.width * 0.5 - 30, // Center button
            child: FloatingActionButton(
              onPressed: () async {
                try {
                  // Ensure the camera is initialized
                  await _initializeControllerFuture;

                  // Capture the image
                  final image = await _controller.takePicture();

                  // Handle the captured image (e.g., save it, display it, etc.)
                  // For example, you could navigate to a new screen with the captured image
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DisplayPictureScreen(imagePath: image.path),
                    ),
                  );
                } catch (e) {
                  print('Error capturing photo: $e');
                }
              },
              child: Icon(Icons.camera_alt,color: Colors.white,size: 32,),
              backgroundColor: Colors.green.shade700,
            ),
          ),
        ],
      ),
    );
  }

}

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  DisplayPictureScreen({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Display Picture',style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.check_circle_outline, color: Colors.green.shade700),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
          SizedBox(width: 10,),
        ],
      ),
      body: Expanded(
        child: Image.file(File(imagePath)),
      ),
    );
  }
}



import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Repository/repository.dart';

import 'Favourites_screen.dart';
import 'login_screen.dart';

class PreviewPage extends StatefulWidget {
  final String imageUrl;
  final int imageId;
  const PreviewPage({
    super.key,
    required this.imageId,
    required this.imageUrl,
  });

  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  Repository repo = Repository();
  bool isAuthenticated = false;
  bool isFirstLogin = true;
  @override
  void initState(){
    super.initState();
    checkLoginStatus();
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

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: null,
      body: CachedNetworkImage(
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        imageUrl: widget.imageUrl,
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
      floatingActionButton: Stack(
        children: [
          Positioned(
            bottom: 16,
            left: 70,
            child: FloatingActionButton(
              backgroundColor: const Color.fromRGBO(230, 10, 10, .5),
              foregroundColor: const Color.fromRGBO(255, 255, 255, .8),
              shape: const CircleBorder(),
              onPressed: () {
                print('Image button pressed');
                _showModalBottomSheet(context);
              },
              child: const Icon(Icons.image,color: Colors.white,),
            ),
          ),
          Positioned(
            bottom: 16,
            left: MediaQuery.of(context).size.width / 2 - 30, // Center horizontally
            child: FloatingActionButton(
              backgroundColor: const Color.fromRGBO(230, 10, 10, .5),
              foregroundColor: const Color.fromRGBO(255, 255, 255, .8),
              shape: const CircleBorder(),
              onPressed: () {
                final snackBar = SnackBar(
                  content: Text('Wallpaper saved successfully!',textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color: Colors.black),),
                  backgroundColor: Colors.white,
                  duration: Duration(seconds: 2),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                try {
                  print('image saved to gallery');
                  SaveImage();
                }catch(e){
                  print(e.toString());
                }
              },
              child: const Icon(Icons.download,color: Colors.white,),
            ),
          ),
          Positioned(
            bottom: 16,
            right: 70,
            child: FloatingActionButton(
              backgroundColor: const Color.fromRGBO(230, 10, 10, .5),
              foregroundColor: const Color.fromRGBO(255, 255, 255, .8),
              shape: const CircleBorder(),
              onPressed: () {
                print('Favorite button pressed');
              },
              child: IconButton(
                icon: provider.isExist(widget.imageUrl)
                    ? const Icon(Icons.favorite, color: Colors.white)
                    : const Icon(Icons.favorite_outline, color: Colors.white),
                onPressed: () async {
                  if (isAuthenticated) {
                    if (provider.isExist(widget.imageUrl)) {
                      provider.toggleFavorites(widget.imageUrl, widget.imageUrl);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Removed from Favorites'),duration: Duration(seconds: 2),),
                      );
                    } else {
                      provider.toggleFavorites(widget.imageUrl, widget.imageUrl);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Added to Favorites'),duration: Duration(seconds: 2),),
                      );
                    }
                  } else {
                    _showAlertDialog(context);
                  }
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
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
  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.black.withOpacity(0.7),
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 280,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
            child: Column(
              children: [
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.center,
                  child : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    Text(
                    'Set Your',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600,color: Colors.green.shade400),),
                      Text(
                    ' Wallpaper',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600,color: Colors.yellow.shade400),),
                    ]),),
                SizedBox(height: 15),
                SizedBox(height: 45,child : ElevatedButton(
                    onPressed: () async {
                      Fluttertoast.showToast(
                        msg: 'Setting wallpaper...',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                      );
                      await Future.delayed(Duration(seconds: 2));

                      var file = await DefaultCacheManager().getSingleFile(widget.imageUrl);
                      bool result = await WallpaperManager.setWallpaperFromFile(
                        file.path,
                        WallpaperManager.HOME_SCREEN,
                      );

                      Fluttertoast.showToast(
                        msg: result
                            ? 'Home Screen Wallpaper set successfully!'
                            : 'Failed to set wallpaper.',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.yellowAccent.shade700,
                        textColor: Colors.black,
                      );

                      if (result) {
                        Navigator.pop(context);
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          )
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.home,color: Colors.black,size: 25,),
                        SizedBox(width: 15,),
                        Text('Background Screen',style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.w500),),
                      ],
                    )),),
                SizedBox(height: 10,),
                SizedBox(height: 45,
                  child : ElevatedButton(
                      onPressed: () async {
                        Fluttertoast.showToast(
                          msg: 'Setting wallpaper...',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                        );
                        await Future.delayed(Duration(seconds: 2));

                        var file = await DefaultCacheManager().getSingleFile(widget.imageUrl);
                        bool result = await WallpaperManager.setWallpaperFromFile(
                          file.path,
                          WallpaperManager.LOCK_SCREEN,
                        );

                        Fluttertoast.showToast(
                          msg: result
                              ? 'Lock Screen Wallpaper set successfully!'
                              : 'Failed to set wallpaper.',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.yellowAccent.shade700,
                          textColor: Colors.black,
                        );

                        if (result) {
                          Navigator.pop(context);
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            )
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.lock,color: Colors.black,size: 25,),
                          SizedBox(width: 15,),
                          Text('Lock Screen',style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.w500),),
                        ],
                      )),),
                SizedBox(height: 10,),
                SizedBox(height: 45,child : ElevatedButton(
                    onPressed: () async {
                      Fluttertoast.showToast(
                        msg: 'Setting wallpaper...',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                      );
                      await Future.delayed(Duration(seconds: 2));

                      var file = await DefaultCacheManager().getSingleFile(widget.imageUrl);
                      bool result = await WallpaperManager.setWallpaperFromFile(
                        file.path,
                        WallpaperManager.BOTH_SCREEN,
                      );

                      Fluttertoast.showToast(
                        msg: result
                            ? 'Both Screens Wallpaper set successfully!'
                            : 'Failed to set wallpaper.',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.yellowAccent.shade700,
                        textColor: Colors.black,
                      );

                      if (result) {
                        Navigator.pop(context);
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          )
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.image,color: Colors.black,size: 25,),
                        SizedBox(width: 15,),
                        Text('Home Screen \& Lock Screen',style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w500),),
                      ],
                    )),),

              ],
            ),
          ),
        );
      },
    );
  }

  void SaveImage() async {
    await GallerySaver.saveImage(widget.imageUrl);
  }
}
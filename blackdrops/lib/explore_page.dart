import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Repository/repository.dart';
import 'package:untitled/modal/modal.dart';
import 'Favourites_screen.dart';
import 'Preview_page.dart';
import 'login_screen.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  Repository repository = Repository();
  ScrollController scrollController = ScrollController();
  //TextEditingController textEditingController = TextEditingController();
  late Future<List<Images>> imagesList;
  int pageNumber = 1;
  final List<String> categories = [
    'Nature', 'Abstract', 'Technology', 'Mountains', 'Cars', 'Bikes', 'People',
    'Architecture', 'Animals', 'Space',
    'Travel', 'Food', 'Fashion', 'Business', 'Sports', 'City', 'Landscape',
    'Art', 'Music', 'Fitness', 'Health', 'Education', 'Lifestyle', 'Holidays',
    'Interior', 'Outdoors', 'Vintage', 'Minimal', 'Macro', 'Underwater', 'Sunset','Desert'
  ];


  final List<String> imageList1 = [
    'https://images.pexels.com/photos/15286/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/3780104/pexels-photo-3780104.png?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/3861969/pexels-photo-3861969.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/618833/pexels-photo-618833.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/120049/pexels-photo-120049.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/1413412/pexels-photo-1413412.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/445109/pexels-photo-445109.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/262367/pexels-photo-262367.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/47547/squirrel-animal-cute-rodents-47547.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/956981/milky-way-starry-sky-night-sky-star-956981.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/346885/pexels-photo-346885.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/1536619/pexels-photo-1536619.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/1957478/pexels-photo-1957478.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/46798/the-ball-stadion-football-the-pitch-46798.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/169647/pexels-photo-169647.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/346529/pexels-photo-346529.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/102127/pexels-photo-102127.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/1105666/pexels-photo-1105666.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/841130/pexels-photo-841130.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/105028/pexels-photo-105028.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/159711/books-bookstore-book-reading-159711.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/1172253/pexels-photo-1172253.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/716738/pexels-photo-716738.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/1090638/pexels-photo-1090638.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/2102587/pexels-photo-2102587.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/92866/pexels-photo-92866.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/62693/pexels-photo-62693.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/62289/yemen-chameleon-chamaeleo-calyptratus-chameleon-reptile-62289.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/2397651/pexels-photo-2397651.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/189349/pexels-photo-189349.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/2245436/pexels-photo-2245436.png?auto=compress&cs=tinysrgb&w=600',
  ];

  void getImagesBySearch({required String query}) {
    imagesList = repository.getImagesBySearch(query: query);
    setState(() {});
  }

  @override
  void initState() {
    imagesList = repository.getImagesList(pageNumber: pageNumber);
    super.initState();
  }

  @override
  void dispose() {
    //textEditingController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  String _activeSection = 'Nature';
  void _handleSectionTap(String section) {
    setState(() {
      _activeSection = section;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9),
      appBar: null,
      body: Column(
        children: [
          // SizedBox(height: 15),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 20),
          //   child: TextField(
          //     style: TextStyle(color: Colors.white),
          //     controller: textEditingController,
          //     cursorColor: Colors.blueAccent,
          //     decoration: InputDecoration(
          //       contentPadding: EdgeInsets.only(left: 25),
          //       hintText: 'Search...',
          //       hintStyle: TextStyle(color: Colors.white),
          //       border: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(25),
          //         borderSide: BorderSide(color: Colors.white, width: 2),
          //       ),
          //       enabledBorder: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(25),
          //         borderSide: BorderSide(color: Colors.white, width: 2),
          //       ),
          //       focusedBorder: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(25),
          //         borderSide: BorderSide(color: Colors.blueAccent, width: 2),
          //       ),
          //       errorBorder: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(25),
          //         borderSide: BorderSide(color: Colors.red, width: 2),
          //       ),
          //       suffixIcon: Padding(
          //         padding: EdgeInsets.only(right: 5),
          //         child: IconButton(
          //           onPressed: () {
          //             getImagesBySearch(query: textEditingController.text);
          //           },
          //           icon: Icon(Icons.search, color: Colors.white),
          //         ),
          //       ),
          //     ),
          //     inputFormatters: [
          //       FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]')),
          //     ],
          //     onSubmitted: (value) {
          //       getImagesBySearch(query: value);
          //     },
          //   ),
          // ),
          SizedBox(height: 25),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 0),
            child : Align(
              alignment: Alignment.centerLeft,
              child : RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 22,
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
              ),),),
          SizedBox(height: 16,),
          Expanded(
            child: GridView.builder(
              controller: scrollController,
              itemCount: categories.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of items per row
                mainAxisSpacing: 20, // Spacing between rows
                crossAxisSpacing: 0, // Spacing between columns
                childAspectRatio: 1, // Aspect ratio of each item
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    getImagesBySearch(query: categories[index]);
                    _handleSectionTap(categories[index]);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ImagesGrid(
                          imagesList: imagesList,
                          scrollController: scrollController,
                          repository: repository,
                          category: categories[index], // Provide the category here
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: _activeSection == categories[index]
                              ? Colors.greenAccent.shade700
                              : Colors.white,
                          width: _activeSection == categories[index] ? 3: 1,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(imageList1[index]),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.4), // Black overlay with 50% opacity
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          Center(
                            child: Text(
                              categories[index],
                              style: TextStyle(
                                color: _activeSection == categories[index]
                                    ? Colors.greenAccent.shade700
                                    : Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


class ImagesGrid extends StatefulWidget {
  final Future<List<Images>> imagesList;
  final ScrollController scrollController;
  final Repository repository;
  final String category;

  ImagesGrid({
    required this.imagesList,
    required this.scrollController,
    required this.repository,
    required this.category,
    Key? key,
  }) : super(key: key);

  @override
  _ImagesGridState createState() => _ImagesGridState();
}

class _ImagesGridState extends State<ImagesGrid> {
  late Future<List<Images>> _imagesList;
  int _pageNumber = 1; // Initialize page number here
  TextEditingController textEditingController = TextEditingController();
  Repository repo = Repository();
  bool isAuthenticated = false;
  bool isFirstLogin = true;

  Future<void> checkLoginStatus() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      isAuthenticated = sharedPreferences.getBool('isAuthenticated') ?? false;
    });
  }

  @override
  void initState() {
    _imagesList = widget.imagesList;
    super.initState();
    checkLoginStatus();
  }

  void _loadMoreImages() {
    setState(() {
      _pageNumber++;
      _imagesList = widget.repository.getImagesList(pageNumber: _pageNumber);
    });
  }

  void getImagesBySearch({required String query}) {
    setState(() {
      _imagesList = repo.getImagesBySearch(query: query);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);

    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9),
      appBar: AppBar(
        title: Text(widget.category, style: TextStyle(color: Colors.white)), // Use widget.category to display the selected category
        backgroundColor: Colors.black.withOpacity(0.9),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_outlined, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(height: 13),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 20),
            //   child: TextField(
            //     style: TextStyle(color: Colors.white),
            //     controller: textEditingController,
            //     cursorColor: Colors.blueAccent,
            //     decoration: InputDecoration(
            //       contentPadding: EdgeInsets.only(left: 25),
            //       hintText: 'Search...',
            //       hintStyle: TextStyle(color: Colors.white),
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(25),
            //         borderSide: BorderSide(color: Colors.white, width: 2),
            //       ),
            //       enabledBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(25),
            //         borderSide: BorderSide(color: Colors.white, width: 2),
            //       ),
            //       focusedBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(25),
            //         borderSide: BorderSide(color: Colors.blueAccent, width: 2),
            //       ),
            //       errorBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(25),
            //         borderSide: BorderSide(color: Colors.red, width: 2),
            //       ),
            //       suffixIcon: Padding(
            //         padding: EdgeInsets.only(right: 5),
            //         child: IconButton(
            //           onPressed: () {
            //             getImagesBySearch(query: textEditingController.text);
            //           },
            //           icon: Icon(Icons.search, color: Colors.white),
            //         ),
            //       ),
            //     ),
            //     inputFormatters: [
            //       FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]')),
            //     ],
            //     onSubmitted: (value) {
            //       getImagesBySearch(query: value);
            //     },
            //   ),
            // ),
            SizedBox(height: 15),
            FutureBuilder(
              future: _imagesList,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Something Went Wrong!'),
                    );
                  }
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                          child: MasonryGridView.count(
                            controller: widget.scrollController,
                            itemCount: snapshot.data?.length,
                            shrinkWrap: true,
                            mainAxisSpacing: 3,
                            crossAxisCount: 2,
                            crossAxisSpacing: 3,
                            itemBuilder: (context, index) {
                              double height = (index % 10 + 1) * 245;
                              final imageUrl = snapshot.data![index].ImagesPortraitPath;
                              final isFavorite = provider.isExist(imageUrl);
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PreviewPage(
                                        imageId: snapshot.data![index].ImagesID,
                                        imageUrl: imageUrl,
                                      ),
                                    ),
                                  );
                                },
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        height: height > 300 ? 300 : height,
                                        imageUrl: imageUrl,
                                        errorWidget: (context, url, error) => Icon(Icons.error),
                                      ),
                                    ),
                                    Positioned(
                                      child: IconButton(
                                        icon: Icon(
                                          isFavorite ? Icons.favorite : Icons.favorite_border,
                                          color: Colors.pinkAccent.shade400,
                                          size: 30,
                                        ),
                                        onPressed: () async {
                                          if (isAuthenticated) {
                                            if (provider.isExist(imageUrl)) {
                                              provider.toggleFavorites(imageUrl,imageUrl);
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                const SnackBar(content: Text('Removed from Favorites')),
                                              );
                                            } else {
                                              provider.toggleFavorites(imageUrl, imageUrl);
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                const SnackBar(content: Text('Added to Favorites')),
                                              );
                                            }
                                          } else {
                                            _showAlertDialog(context);
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        MaterialButton(
                          onPressed: _loadMoreImages,
                          child: Text(
                            'Load More...',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                          ),
                          minWidth: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          color: Colors.blue,
                          textColor: Colors.white,
                        ),
                      ],
                    ),
                  );
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 300),
                      Center(
                        child: CircularProgressIndicator(color: Colors.red.shade700),
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
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
              title: Center(
                child: Text(
                  'Add to your Favourites?',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: Colors.yellow.shade800),
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Center(
                    child: Text(
                      'Want to add some of content to the Favourites? Sign In to get started.',
                      style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ),
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
                            ),
                          ),
                        ),
                        child: Text(
                          'Cancel',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      SizedBox(width: 20),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginScreen()),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.cyan.shade600),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                        child: Text(
                          'Sign In',
                          style: TextStyle(color: Colors.black),
                        ),
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

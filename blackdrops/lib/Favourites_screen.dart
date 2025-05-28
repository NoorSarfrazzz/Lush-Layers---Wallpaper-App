import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Preview_page.dart';
import 'Repository/repository.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    final imageUrls = provider.imageUrls;
    final imageNames = provider.imageNames;
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9),
      body: imageUrls.isEmpty
          ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.white54,
              ),
              child: Icon(Icons.favorite, color: Colors.black, size: 100),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'You don\'t have any favorites yet.',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17,
              color: Colors.yellow.shade600,
            ),
          ),
          Text(
            'Click some hearts.',
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        ],
      )
          : GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 13.0,
          mainAxisSpacing: 10.0,
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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: CachedNetworkImage(
                          imageUrl: imageUrls[index],
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: IconButton(
                          icon: provider.isExist(imageUrls[index])
                              ? const Icon(Icons.favorite, color: Colors.red)
                              : const Icon(Icons.favorite_outline, color: Colors.white),
                          onPressed: () {
                            provider.toggleFavorites(imageUrls[index], imageNames[index]);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class FavoriteProvider extends ChangeNotifier {
  final List<String> _imageUrls = [];
  final List<String> _imageNames = [];
  final Repository _repository = Repository(); // Initialize repository

  List<String> get imageUrls => _imageUrls;
  List<String> get imageNames => _imageNames;

  // Method to toggle favorites using URL and name directly
  void toggleFavorites(String url, String name) {
    if (_imageUrls.contains(url)) {
      // Remove from favorites
      final index = _imageUrls.indexOf(url);
      _imageUrls.removeAt(index);
      _imageNames.removeAt(index);
    } else {
      // Add to favorites
      _imageUrls.add(url);
      _imageNames.add(name);
    }
    notifyListeners();
  }

  bool isExist(String url) {
    return _imageUrls.contains(url);
  }

  void clearFavorites() {
    _imageUrls.clear();
    _imageNames.clear();
    notifyListeners();
  }
}

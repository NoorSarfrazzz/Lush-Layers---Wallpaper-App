import 'dart:convert';
import 'dart:io';

import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:media_scanner/media_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/modal/modal.dart';
import 'package:http/http.dart' as http;

class Repository {
  final String apiKey = 'saTVTgVnMLxw3WkQDjQYkjBQA8dtNEatYBNaJru6savuNVaA6aXb7drY';
  final String baseURL = 'https://api.pexels.com/v1/';

  Future<List<Images>> getImagesList({required int? pageNumber}) async {
    String url = '';

    if (pageNumber == null) {
      url = '${baseURL}curated?per_page=80';
    } else {
      url = '${baseURL}curated?per_page=80&page=$pageNumber';
    }

    List<Images> ImagesList = [];

    try {
      final response = await http.get(
        Uri.parse(url), headers: {'Authorization': apiKey,},);
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        final jsonData = json.decode(response.body);
        for (final json in jsonData['photos'] as Iterable) {
          final image = Images.fromJson(json);
          ImagesList.add(image);
        }
      }
    } catch (_) {
      return ImagesList;
    }

    return ImagesList;
  }

  Future<Images> getImagesByID({required int id}) async {
    final url = '${baseURL}photos/$id';

    Images image = Images.emptyConstructor();

    try {
      final response = await http.get(
        Uri.parse(url), headers: {'Authorization': apiKey,},);
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        final jsonData = json.decode(response.body);
        image = Images.fromJson(jsonData);
      }
    } catch (_) {}
    return image;
  }

  Future<List<Images>> getImagesBySearch({required String query}) async {
    final url = "${baseURL}search?query=$query&per_page=80";
    List<Images> ImagessList = [];

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': apiKey,
        },
      );

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        final jsonData = json.decode(response.body);

        for (final json in jsonData["photos"] as Iterable) {
          final image = Images.fromJson(json);
          ImagessList.add(image);
        }
      }
    } catch (_) {}

    return ImagessList;
  }

  Future<void> downloadImages({required String ImagesUrl,
    required int ImagesId,
    required BuildContext context}) async {
    try {
      final response = await http.get(Uri.parse(ImagesUrl));

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        final bytes = response.bodyBytes;
        final directory = await ExternalPath
            .getExternalStoragePublicDirectory(
            ExternalPath.DIRECTORY_DOWNLOADS);

        final file = File("$directory/$ImagesId.png");
        await file.writeAsBytes(bytes);

        MediaScanner.loadMedia(path: file.path);

        if (context.mounted) {
          ScaffoldMessenger.of(context).clearSnackBars();

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text("File's been saved at : ${file.path}"),
              duration: const Duration(seconds: 2),
            ),
          );
        }
      }
    } catch (_) {}
  }

// Save image to favorites
  Future<void> saveToFavorites(int imageId, String imageUrl) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList('favorites') ?? [];

    print('Current favorites: $favorites');

    final favoriteItem = '$imageId,$imageUrl';

    if (!favorites.contains(favoriteItem)) {
      favorites.add(favoriteItem);
      final success = await prefs.setStringList('favorites', favorites);
      if (success) {
        print('Favorite added successfully: $favoriteItem');
      } else {
        print('Failed to add favorite');
      }
    } else {
      print('Favorite already exists: $favoriteItem');
    }
  }

// Print all favorites (for debugging)
  Future<void> printFavorites() async {
    final favorites = await getFavorites();
    print("Favorites: $favorites");
  }

// Retrieve list of favorite images
  Future<List<Map<String, String>>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList('favorites') ?? [];

    return favorites.map((fav) {
      final parts = fav.split(',');
      return {
        'id': parts[0],
        'url': parts[1],
      };
    }).toList();
  }

}
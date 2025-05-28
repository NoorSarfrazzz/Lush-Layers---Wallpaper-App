import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:untitled/Repository/repository.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:untitled/modal/modal.dart';
import 'package:untitled/Preview_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Repository repository = Repository();
  ScrollController scrollController = ScrollController();
  TextEditingController textEditingController = TextEditingController();
  late Future<List<Images>> imagesList;
  int pageNumber = 1;
  final List<String> categories= [
    'Nature','Abstract','Technology','Mountains','Cars','Bikes','People',
  ];

  void getImagesBySearch({required String query}){
    imagesList = repository.getImagesBySearch(query: query);
    setState(() {
    });
  }

  @override
  void initState(){
    imagesList = repository.getImagesList(pageNumber: pageNumber);
    super.initState();
  }
  @override
  void dispose(){
    textEditingController.dispose();
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
      body : SingleChildScrollView(
        controller: scrollController,
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 10,),
            Padding(padding: EdgeInsets.symmetric(horizontal: 20),
            child : TextField(
              style: TextStyle(color: Colors.white),
              controller: textEditingController,
              cursorColor: Colors.yellow,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 25),
                hintText: 'Search...',
                hintStyle: TextStyle(color: Colors.white60),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Colors.white,width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Colors.white,width: 2),
                ),
                  focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Colors.yellow.shade400,width: 2),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Colors.red,width: 2),
                ),
                suffixIcon: Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: IconButton(
                    onPressed: (){getImagesBySearch(query : textEditingController.text);},
                    icon: Icon(Icons.search,color: Colors.white,),
                  ),
                )
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]')),
              ],
              onSubmitted: (value){
                getImagesBySearch(query: value);
              },
            ),
            ),
            SizedBox(height: 20,),
            SizedBox(
              height: 40,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: (){
                      getImagesBySearch(query: categories[index]);
                        _handleSectionTap(categories[index]);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: _activeSection == categories[index] ? Colors.greenAccent.shade700 : Colors.white,width: _activeSection == categories[index] ? 2.5:1),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 0),
                          child: Center(child : Text(categories[index],style: TextStyle(color: _activeSection == categories[index] ? Colors.greenAccent.shade700 : Colors.white),)),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20,),
            FutureBuilder(future: imagesList, builder: (context,snapshot){
              if(snapshot.connectionState ==  ConnectionState.done){
                if(snapshot.hasError){
                  return Center(
                    child: Text('Something Went Wrong!'),
                  );
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(padding: EdgeInsets.symmetric(horizontal: 15),
                    child: MasonryGridView.count(
                      controller: scrollController,
                      itemCount: snapshot.data?.length,
                      shrinkWrap: true,
                      mainAxisSpacing: 5,
                      crossAxisCount: 2,crossAxisSpacing: 5,
                      itemBuilder: (context,index){
                        double height = (index % 10 + 1) * 100;
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PreviewPage(
                                imageId: snapshot.data![index].ImagesID,
                                imageUrl: snapshot.data![index].ImagesPortraitPath,
                              ))
                            );
                          },
                          child: ClipRRect(borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            height: height > 300 ? 300 : height,
                            imageUrl: snapshot.data![index].ImagesPortraitPath,
                            errorWidget: (context,url,error) => Icon(Icons.error),
                          ),),
                        );
                      },
                    ),
                    ),
                    SizedBox(height: 20,),
                    MaterialButton(onPressed: (){
                      pageNumber++;
                      imagesList = repository.getImagesList(pageNumber: pageNumber);
                      setState(() {
                      });
                    },
                      child: Text('Load More',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                      minWidth: double.infinity,
                      padding: EdgeInsets.symmetric(vertical:10),
                      color: Colors.greenAccent.shade700,
                      textColor: Colors.black,
                    ),
                  ],
                );
              }else{
                return Center(
                  child: CircularProgressIndicator(color: Colors.red,),
                );
              }
            },),
          ],
        )
      )
    );
    }
  }

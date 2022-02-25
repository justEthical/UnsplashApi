import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:yourlibaas/Models/Image_detail_model.dart';

class ImageGridView extends StatefulWidget {
  const ImageGridView({Key? key}) : super(key: key);

  @override
  _ImageGridViewState createState() => _ImageGridViewState();
}

class _ImageGridViewState extends State<ImageGridView> {
  final ScrollController _scrollController = ScrollController();
  List<ImageDetail> imgList = [];
  int page = 1;
  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mockRequest();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent &&
          !loading) {
        print("new data call with page number $page");
        _mockRequest();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        controller: _scrollController,
        itemBuilder: (ctx, i) {
          return Card(
              elevation: 5,
              child: Image.network(
                imgList[i].thumb!,
                fit: BoxFit.cover,
              ));
        },
        itemCount: imgList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  _mockRequest() async {
    loading = true;
    var api = "https://api.unsplash.com/photos?page=$page";
    var response = await http.get(
      Uri.parse(api),
      headers: {
        "Authorization":
            'Client-ID D2HfNoC0ACA72Kc80UCDZCGSDRL_Rqyuv5eN56dlW-o',
      },
    );

    if (response.statusCode == 200) {
      List images = jsonDecode(response.body);
      for (var element in images) {
        var id = element["id"];
        var thumb = element["urls"]["thumb"];
        var img = element["urls"]["regular"];
        var blurHash = element["blur_hash"];

        ImageDetail imgDetail = ImageDetail(id, blurHash, img, thumb);

        imgList.add(imgDetail);
      }
    } else {
      print("Something went wrong");
    }

    setState(() {});
    page++;
    loading = false;
  }
}

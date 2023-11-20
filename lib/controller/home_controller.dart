import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import '../model/product_model.dart';

class HomeController extends GetxController {
  int selectdColorIndex=0;
  int selectdSizeIndex=0;
  bool is3dObjectTapped=false;
  CarouselController carouselController=CarouselController();
  List<Product> productList = [
    Product(
      id: 1,
      name: 'Nike Air Max 200',
      price: 240.00,
      isSelected: true,
      isliked: false,
      category: "Trending Now",
      imageList:['assets/egg_0.glb','assets/egg_1.glb','assets/egg_2.glb'],
      colorList:[const Color(0xff20262C),const Color(0xffffffff),const Color(0xff747F8F)],
    ),
    Product(
        id: 2,
        name: 'Nike Air Max 97',
        price: 220.00,
        isliked: false,
        isSelected: false,
        imageList:['assets/egg_2.glb','assets/egg_1.glb','assets/egg_0.glb'],
        colorList:[const Color(0xff20262C),const Color(0xffffffff),const Color(0xff747F8F)],
        category: "Trending Now"),
    Product(
      id: 1,
      name: 'Nike Air Max 200',
      price: 240.00,
      isSelected: false,
      isliked: false,
      category: "Trending Now",
      imageList:['assets/egg_0.glb','assets/egg_1.glb','assets/egg_2.glb'],
      colorList:[const Color(0xff20262C),const Color(0xffffffff),const Color(0xff747F8F)],
    ),
  ];
  List<Product> cartList=[];
  List<Widget> colorList=[];
List<Widget> imageWidget=[];
int selectdPageIndex=0;
  HomeController(){
    pageViewUpdate();
    colorWidget();
  }
  pageViewUpdate({int selectedColor=0}){
    imageWidget=[];
    var selectedProduct =productList.where((element) => element.isSelected??false).toList();
    for (var element in selectedProduct) {
      element.imageList?.map((e) => imageWidget.add(Container(
          height: 200,
          decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child:ModelViewer(
            key: ValueKey('teygh$e'),
            id: "oeuvr32es3D$e",
            autoRotateDelay: 500,
            backgroundColor: Colors.transparent,
            src:e,
            autoRotate: true,
            disableTap: true,
            disableZoom: true,
          )
      ))).toList();
    }
    update();
  }

  colorWidget({bool isSelected = false}) {
    colorList=[];
    var selectedProduct=productList.firstWhere((element) => element.isSelected??false);
    selectedProduct.colorList?.forEach((element) {
      colorList.add(
          CircleAvatar(
            radius: 10,
            backgroundColor: isSelected?Colors.transparent:element.withAlpha(150),
            // backgroundColor: Colors.transparent,
            child: isSelected
                ? Icon(
              Icons.check_circle,
              color: element,
              size: 25,
            )
                : CircleAvatar(radius: 0, backgroundColor: element),
          )
      );
    });
    update();
  }
}
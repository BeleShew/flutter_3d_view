import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_3d_object/controller/home_controller.dart';
import 'package:flutter_3d_object/screen/credit_form.dart';
import 'package:flutter_3d_object/screen/product_details_page.dart';
import 'package:flutter_3d_object/widget/extension.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key}) {
    Get.put(HomeController());
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor:const Color(0xfffebe9f4),
          actions:[
            Padding(padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Stack(
              children: [
                const Icon(Icons.shopping_cart,color: Colors.black,size: 30,),
                controller.cartList.isNotEmpty?
                Container(
                  width: 18,
                  height: 18,
                  decoration: const BoxDecoration(color: Colors.red,shape: BoxShape.circle),
                  child: Center(child: Text('${controller.cartList.length}',style: TextStyle(color: Colors.white,fontSize: 14),)),
                ):Container(),
              ],
            ),
            )
          ]
        ),
        backgroundColor:const Color(0xfffebe9f4),
        body: SingleChildScrollView(
          child: Container(
            color: const Color(0xfffebe9f4),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  InkWell(
                    onTap: (){
                        controller.is3dObjectTapped=true;
                        controller.update();
                    },
                    child: SizedBox(
                      height:400,
                      width: MediaQuery.of(context).size.width,
                      child:GridView.count(
                          crossAxisCount: 3,
                          crossAxisSpacing: 0,
                          mainAxisSpacing: 0,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: List.generate(controller.imageWidget.length, (index) {
                            return Hero(
                                tag: controller.imageWidget[index],
                                child: GestureDetector(
                                  onTap: () {
                                  },
                                  child:  controller.imageWidget[index],
                                ),
                              );
                          }),
                      ),
                      // CarouselSlider(
                      //     items: controller.imageWidget,
                      //     options:  CarouselOptions(
                      //       height: 400,
                      //       aspectRatio: 16/9,
                      //       viewportFraction: 0.8,
                      //       initialPage: 0,
                      //       reverse: false,
                      //       autoPlay: false,
                      //       autoPlayInterval: const Duration(seconds: 3),
                      //       autoPlayAnimationDuration: const Duration(milliseconds: 800),
                      //       autoPlayCurve: Curves.fastOutSlowIn,
                      //       enlargeCenterPage: true,
                      //       enlargeFactor: 0.3,
                      //       onPageChanged:(index,reason){
                      //         controller.selectdPageIndex=index;
                      //         for (var element in controller.productList) {element.isSelected=false;}
                      //         controller.productList[index].isSelected=true;
                      //         controller.colorWidget();
                      //         controller.update();
                      //       },
                      //       scrollDirection: Axis.horizontal,
                      //     )
                      // ),
                    ),
                  ),
                controller.is3dObjectTapped?
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Center(
                          child: Text('Color :',style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal,fontSize: 20),),
                        ),
                        const SizedBox(height: 10,),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap:(){
                                  controller.selectdColorIndex=0;
                                  controller.pageViewUpdate(selectedColor: 0);
                                  controller.update();
                                },
                                child:
                                Stack(
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        shape: BoxShape.circle,

                                      ),
                                    ),
                                    controller.selectdColorIndex==0?
                                    Icon(Icons.check_circle,color: Colors.grey,size: 30,):Container()
                                  ],
                                ),
                              ),
                              const SizedBox(width: 20,),
                              InkWell(
                                onTap:(){
                                  controller.selectdColorIndex=1;
                                  controller.pageViewUpdate(selectedColor: 1);
                                  controller.update();
                                },
                                child:
                                Stack(
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade100,
                                        shape: BoxShape.circle,

                                      ),
                                    ),
                                    controller.selectdColorIndex==1?
                                    Icon(Icons.check_circle,color: Colors.grey.shade300,size: 30,):Container()
                                  ],
                                ),
                              ),
                              const SizedBox(width: 20,),
                              InkWell(
                                onTap:(){
                                  controller.selectdColorIndex=2;
                                  controller.pageViewUpdate(selectedColor: 2);
                                  controller.update();
                                },
                                child:
                                Stack(
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: const BoxDecoration(
                                        color: Colors.grey,
                                        shape: BoxShape.circle,

                                      ),
                                    ),
                                    controller.selectdColorIndex==2?
                                    Icon(Icons.check_circle,color: Colors.grey.shade800,size: 30,):Container()
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30,),
                        const Center(
                          child:  Text('Size :',style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal,fontSize: 20),),
                        ),
                        const SizedBox(height: 10,),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: (){
                                  controller.imageSize=300;
                                  controller.selectdSizeIndex=0;
                                  controller.update();
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                  decoration: BoxDecoration(
                                      color: controller.selectdSizeIndex==0?Colors.black:Colors.transparent,
                                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                                      border: Border.all(color: Colors.grey)
                                  ),
                                  child:  Text('S',style: TextStyle(color: controller.selectdSizeIndex==0?Colors.white: Colors.black,fontWeight: FontWeight.normal,fontSize: 15),),
                                ),
                              ),
                              const SizedBox(width: 10,),
                              InkWell(
                                onTap: (){
                                  controller.imageSize=400;
                                  controller.selectdSizeIndex=1;
                                  controller.update();
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                  decoration: BoxDecoration(
                                      color: controller.selectdSizeIndex==1?Colors.black:Colors.transparent,
                                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                                      border: Border.all(color: Colors.grey)
                                  ),
                                  child:  Text('M',style: TextStyle(color: controller.selectdSizeIndex==1?Colors.white: Colors.black,fontWeight: FontWeight.normal,fontSize: 15),),
                                ),
                              ),
                              const SizedBox(width: 10,),
                              InkWell(
                                onTap: (){
                                  controller.imageSize=500;
                                  controller.selectdSizeIndex=2;
                                  controller.update();
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                  decoration: BoxDecoration(
                                      color: controller.selectdSizeIndex==2?Colors.black:Colors.transparent,
                                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                                      border: Border.all(color: Colors.grey)
                                  ),
                                  child:  Text('L',style: TextStyle(color: controller.selectdSizeIndex==2?Colors.white: Colors.black,fontWeight: FontWeight.normal,fontSize: 15),),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Padding(padding:const EdgeInsets.symmetric(horizontal: 10),
                            child: ElevatedButton(
                                onPressed: (){
                                  controller.cartList.add(controller.productList[controller.selectdPageIndex]);
                                  controller.update();
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Align(
                                          alignment:Alignment.topRight,
                                          child: InkWell(
                                            onTap:(){
                                              Navigator.of(context).pop();
                                            },
                                            child: const Icon(Icons.close,color: Colors.black,size: 20,),
                                          ),
                                        ),
                                        content: ProductDetails( imageUrl: controller.productList[controller.selectdPageIndex].imageList?[controller.selectdColorIndex]??"",),
                                      );
                                    },
                                  );
                                },
                                child: const Padding(padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Text('Add to cart',style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal,fontSize: 20),),
                                )
                            )
                        ),
                      ],
                    )
                ):Container(),
              ],
            ),
          ),
        ),
      );
    });
  }
}

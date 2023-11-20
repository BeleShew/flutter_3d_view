import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

import 'credit_form.dart';

class ProductDetails extends StatelessWidget {
   ProductDetails({super.key,required this.imageUrl});
   String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
        height: 250,
        decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child:ModelViewer(
          key: ValueKey(imageUrl),
          id: "oeuvres3D",
          backgroundColor: Colors.transparent,
          src:imageUrl,
          autoRotate: true,
          disableZoom: true,
        )
    ),
        const SizedBox( height: 20,),
        const Text("Do you want to proceed to checkout?", style:TextStyle(color: Colors.black,fontSize: 14),),
        const SizedBox( height: 20,),

        Align(
          alignment: Alignment.bottomRight,
          child: ElevatedButton(
              onPressed: (){
                Navigator.of(context).pop();
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Align(
                        alignment:Alignment.center,
                        child: InkWell(
                          onTap:(){
                            Navigator.of(context).pop();
                          },
                          child: Text('Credit Form'),
                        ),
                      ),
                      content: CrediForms(),
                    );
                  },
                );
              }, child:  const Text("checkout", style:TextStyle(color: Colors.black,fontSize: 12),))
        ),
      ],
    );
  }
}


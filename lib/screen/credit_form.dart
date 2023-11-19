
import 'package:flutter/material.dart';

class CrediForms extends StatelessWidget {
  const CrediForms({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // const SizedBox(height: 30,),
        TextFormField(
          decoration:const InputDecoration(
            label:Text('Credit Card Nimber'),
          ),
          // The validator receives the text that the user has entered.
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),
        TextFormField(
          decoration:const InputDecoration(
            label:Text('Cvv Number'),
          ),
          // The validator receives the text that the user has entered.
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Cvv Number';
            }
            return null;
          },
        ),
        TextFormField(
          decoration:const InputDecoration(
            label:Text('Expire Date'),
          ),
          // The validator receives the text that the user has entered.
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Expire Date';
            }
            return null;
          },
        ),
        const SizedBox(height: 30,),
        Align(
          alignment: Alignment.bottomRight,
          child:ElevatedButton(onPressed: (){
            Navigator.of(context).pop();
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  actions:[
                    ElevatedButton(
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                        child:  const Text("Close", style:TextStyle(color: Colors.black,fontSize: 12),))
                  ],
                  content:const Text("Tank you for your purchase."),
                );
              },
            );
          }, child: const Text('Purchase Now',style:TextStyle(color: Colors.black,fontSize: 12)))
        ),
      ],
    );
  }
}

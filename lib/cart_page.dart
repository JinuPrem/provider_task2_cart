import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_task2_cart/provider/provider_page.dart';
class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override

  Widget build(BuildContext context) {
    final object=Provider.of<Provider_class>(context);
    List nameStore=object.favoriteName;
    List unitStore=object.favoriteUnit;
    List priceStore=object.favoritePrice;
    List imagesStore=object.favoriteImages;


    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Product List')),
        actions: [Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Icon(Icons.shopping_cart),
        )],
      ),
      body: ListView.builder(
        shrinkWrap: true,

          itemCount: nameStore.length,
          itemBuilder: (BuildContext context, int index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage(imagesStore[index]))
                        ),
                      ),
                      title: Text('Name:${nameStore[index]}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Unit:${unitStore[index]}'),
                          Text('Price:${priceStore[index]}'),
                        ],
                      ),
                      trailing: ElevatedButton(onPressed: (){
                        object.favorites(nameStore[index], unitStore[index], priceStore[index], imagesStore[index]);
                      },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.black54
                          ),
                          child: Text('Remove')),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}

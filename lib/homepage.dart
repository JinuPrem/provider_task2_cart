import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_task2_cart/provider/provider_page.dart';
import 'cart_datamodel.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List name = [
    'Apple',
    'Mango',
    'Banana',
    'Grapes',
    'Watermelon',
    'Kiwi',
    'Orange',
    'Peach'
  ];
  List unit = ['Kg', 'Doz', 'Doz', 'Kg', 'Kg', 'Pc', 'Doz', 'Ps'];
  List price = ['\$20', '\$30', '\$10', '\$8', '\$25', '\$40', '\$15', '\$25'];
  List image = [
    'images/apple.jpeg',
    'images/mango.jpeg',
    'images/banana.jpeg',
    'images/grapes.jpeg',
    'images/watermelon.jpeg',
    'images/kiwi.jpeg',
    'images/orange.jpeg',
    'images/peach.jpeg'
  ];

  List<CartDataModel> shopping = [];
  @override
  void initState() {
    super.initState();
    shopping = List.generate(name.length, (index) {
      return CartDataModel(
        name: name[index],
        unit: unit[index],
        price: price[index],
        image: image[index],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final object = Provider.of<Provider_class>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Stack(alignment: Alignment.center, children: [
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Cart()));
                },
                icon: const Icon(Icons.shopping_cart),
              ),
              if (object.favoriteItemCount > 0)
                Positioned(
                  top: 0,
                  right: 0,
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 10,
                    child: Text(
                      object.favoriteItemCount.toString(),
                      style: const TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                )
            ]),
          ),

        ],
      ),
      body: ListView.builder(
          itemCount: shopping.length,
          itemBuilder: (BuildContext context, int index) {
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
                            image: DecorationImage(
                                image: AssetImage(shopping[index].image))),
                      ),
                      title: Text('Name:${shopping[index].name}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Unit:${shopping[index].unit}'),
                          Text('Price:${shopping[index].price}'),
                        ],
                      ),
                      trailing: ElevatedButton(
                          onPressed: () {
                            object.favorites(
                                shopping[index].name,
                                shopping[index].unit,
                                shopping[index].price,
                                shopping[index].image);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black54),
                          child: const Text('Add to Cart')),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}

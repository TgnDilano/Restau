import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top),
            Container(
              height: 70,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    child: Icon(
                      FontAwesomeIcons.barsStaggered,
                      color: Colors.grey[700],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                    ),
                    child: const Text("Welcome Home"),
                  ),
                  const SizedBox(
                    width: 40,
                    height: 40,
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: const Text(
                "Main\nCategories",
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 80,
              //color: Colors.green,
              width: double.infinity,
              child: ListView.builder(
                itemCount: listOfIcons.length,
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 6,
                    ),
                    child: ProdCat(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      iconData: listOfIcons[index],
                      isSelected: index == selectedIndex,
                    ),
                  );
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
            const SizedBox(height: 6),
            Container(
              height: 589,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: menuItems.length,
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                    itemBuilder: (context, index) {
                      return Dish(
                        imgUrl: menuItems[index]['imgUrl'] ?? '',
                        title: menuItems[index]['title'] ?? "Burger Lite",
                        subText: menuItems[index]['subText'] ?? "Spicy",
                        price: double.parse(
                          menuItems[index]['price'].toString(),
                        ),
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: constraints.maxWidth > 700 ? 2 : 1,
                      childAspectRatio: 20 / 9,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                    ),
                  );
                },
              ),
            ),
            /* Container(
              height: 589,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: menuItems.length ~/ 2,
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemBuilder: (ctxt, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: ProductWidget(
                      imgUrl: menuItems[index]['imgUrl']!,
                      price: 45.45,
                      subText: menuItems[index]['subText']!,
                      title: menuItems[index]['title']!,
                    ),
                  );
                },
              ),
            ), */
          ],
        ),
      ),
    );
  }
}

class Dish extends StatelessWidget {
  const Dish({
    Key? key,
    required this.title,
    required this.subText,
    required this.price,
    required this.imgUrl,
  }) : super(key: key);

  final String title;
  final String subText;
  final double price;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      decoration: BoxDecoration(
        //color: Colors.red,
        border: Border.all(
          width: 0.8,
          color: Colors.grey[300]!,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Image.network(
              imgUrl,
              width: 220,
              height: 220,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 36,
              top: 12,
              bottom: 12,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subText,
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$ $price",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        FontAwesomeIcons.heart,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

const listOfIcons = [
  FontAwesomeIcons.burger,
  FontAwesomeIcons.iceCream,
  FontAwesomeIcons.beerMugEmpty,
  FontAwesomeIcons.martiniGlass,
  FontAwesomeIcons.plateWheat,
  FontAwesomeIcons.deezer,
];

const menuItems = [
  {
    "title": "Spaghetti",
    "subText": 'Spicy with Galic',
    'price': '45.45',
    'imgUrl':
        "https://www.pngall.com/wp-content/uploads/2/Meal-PNG-Download-Image.png"
  },
  {
    "title": "Hot Dog",
    "subText": 'Spicy with Galic',
    'price': '45.45',
    'imgUrl':
        "https://www.pngall.com/wp-content/uploads/2/Meal-PNG-Download-Image.png"
  },
  {
    "title": "Shawarma",
    "subText": 'Spicy with Galic',
    'price': '45.45',
    'imgUrl':
        "https://www.pngall.com/wp-content/uploads/2/Meal-PNG-Download-Image.png"
  },
  {
    "title": "Noddles",
    "subText": 'Spicy with Galic',
    'price': '45.45',
    'imgUrl':
        "https://www.pngall.com/wp-content/uploads/2/Meal-PNG-Download-Image.png"
  },
];

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    Key? key,
    required this.title,
    required this.subText,
    required this.price,
    required this.imgUrl,
  }) : super(key: key);

  final String title;
  final String subText;
  final double price;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 280,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300]!,
            spreadRadius: 0.7,
            blurRadius: 1.9,
          ),
          const BoxShadow(
            color: Colors.white70,
            spreadRadius: 0.7,
            blurRadius: 1.9,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Image.network(
              imgUrl,
              width: 150,
              height: 180,
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            subText,
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$ $price",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  FontAwesomeIcons.heart,
                  size: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class ProdCat extends StatelessWidget {
  const ProdCat({
    Key? key,
    required this.iconData,
    required this.isSelected,
    this.onTap,
  }) : super(key: key);

  final IconData iconData;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300]!,
              spreadRadius: 0.7,
              blurRadius: 1.9,
            ),
            const BoxShadow(
              color: Colors.white70,
              spreadRadius: 0.7,
              blurRadius: 1.9,
            )
          ],
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Icon(
          iconData,
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}

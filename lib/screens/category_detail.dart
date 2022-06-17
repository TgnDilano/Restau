import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_app/screens/categories.dart';

import 'data.dart';

class CategoriesDetails extends StatefulWidget {
  const CategoriesDetails({Key? key}) : super(key: key);

  @override
  State<CategoriesDetails> createState() => _CategoriesDetailsState();
}

String key = catAndProducts.keys.toList()[0];

class _CategoriesDetailsState extends State<CategoriesDetails> {
  int selectedIndex = 0;

  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top),
            SizedBox(
              height: 60,
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
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
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
            const SizedBox(height: 8),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(top: 12),
              child: const Text(
                "What do you want to eat today?",
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 50,
              child: TextFormField(
                cursorColor: Colors.orange,
                decoration: InputDecoration(
                  suffixIcon: const Icon(
                    FontAwesomeIcons.search,
                    color: Colors.black87,
                  ),
                  hintText: "Find your yummy",
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 0.8,
                      color: Colors.orange,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 0.8, color: Colors.red),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),
            Container(
              alignment: Alignment.center,
              height: 35,
              width: double.infinity,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                controller: scrollController,
                itemCount: catAndProducts.length,
                itemBuilder: (ctx, index) {
                  return GestureDetector(
                    onTap: () {
                      key = catAndProducts.keys.toList()[index];
                      scrollController.jumpTo(
                        0,
                      );
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 16,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          ),
                          color: selectedIndex == index
                              ? Colors.orange
                              : Colors.transparent,
                        ),
                        child: Text(
                          catAndProducts.keys.toList()[index],
                          style: TextStyle(
                            color: selectedIndex == index
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                "Products",
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: catAndProducts[key]?.length,
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                    itemBuilder: (context, index) {
                      return Dish(
                        imgUrl: catAndProducts[key]![index]['imgUrl'] ?? "",
                        title: catAndProducts[key]![index]['title'] ??
                            "Burger Lite",
                        subText:
                            catAndProducts[key]![index]['subText'] ?? "Spicy",
                        price: double.parse(
                          catAndProducts[key]![index]['price'].toString(),
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
    return GestureDetector(
      onTap: () {
        print("CALLED");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return ProductDetail(
              category: key,
              productName: title,
              price: price.toString(),
              desc: subText,
              imgUrl: imgUrl,
            );
          }),
        );
      },
      child: Container(
        height: 20,
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.8,
            color: Colors.grey[300]!,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/$imgUrl",
                width: 215,
                height: 220,
                errorBuilder: (context, _, trace) {
                  return Container();
                },
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
                      color: Colors.orange,
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
                          color: Colors.grey[100],
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          FontAwesomeIcons.heart,
                          color: Colors.red,
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
      ),
    );
  }
}

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
          /* Container(
            child: Image.network(
              imgUrl,
              width: 150,
              height: 180,
            ),
          ), */
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
          color: isSelected ? Colors.orange : Colors.white,
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
          border: Border.all(width: 1.2, color: Colors.grey[200]!),
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

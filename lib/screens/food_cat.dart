import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_app/screens/food_details.dart';

import 'data.dart';

class FoodCategories extends StatefulWidget {
  const FoodCategories({Key? key}) : super(key: key);

  @override
  State<FoodCategories> createState() => _FoodCategoriesState();
}

String key = catAndProducts.keys.toList()[0];

class _FoodCategoriesState extends State<FoodCategories> {
  int selectedIndex = 0;

  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
            top: 16,
            left: 12,
            right: 12,
          ),
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
                      child: const Text("Welcome to Mega De Voss"),
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
                      borderSide:
                          const BorderSide(width: 0.8, color: Colors.red),
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
                      child: MenuItems(
                        selected: selectedIndex == index,
                        text: catAndProducts.keys.toList()[index],
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
              LayoutBuilder(
                builder: (context, constraints) {
                  return Container(
                    height: constraints.maxWidth > 700 ? 280 : 535,
                    child: GridView.builder(
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
                    ),
                  );
                },
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuItems extends StatelessWidget {
  const MenuItems({
    Key? key,
    required this.selected,
    required this.text,
  }) : super(key: key);

  final bool selected;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 6),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
              vertical: 6,
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              color: selected ? Colors.orange : Colors.transparent,
            ),
            child: Text(
              text,
              style: TextStyle(
                color: selected ? Colors.white : Colors.black,
              ),
            ),
          ),
        ],
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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return MealDetail(
              category: key,
              mealName: title,
              price: price.toString(),
              desc: subText,
              imgUrl: imgUrl,
            );
          }),
        );
      },
      child: Container(
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
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Hero(
                    tag: imgUrl,
                    child: Image.asset(
                      "assets/$imgUrl",
                      fit: BoxFit.fill,
                      height: 140,
                      errorBuilder: (context, _, trace) {
                        return Container();
                      },
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Text(
                        title,
                        maxLines: 4,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      subText,
                      textAlign: TextAlign.center,
                      maxLines: 4,
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Row(
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
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

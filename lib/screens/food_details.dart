import 'package:flutter/material.dart';

class MealDetail extends StatelessWidget {
  const MealDetail({
    Key? key,
    required this.mealName,
    required this.category,
    required this.price,
    required this.desc,
    required this.imgUrl,
  }) : super(key: key);

  final String mealName;
  final String category;
  final String price;
  final String desc;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top.toDouble(),
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            alignment: Alignment.center,
            width: double.infinity,
            height: 320,
            child: Image.asset(
              "assets/$imgUrl",
              width: double.infinity,
              height: 320,
              fit: BoxFit.fill,
              errorBuilder: (context, _, trace) {
                return Container(color: Colors.red);
              },
              // loadingBuilder: (ctx, _, trace) {
              //   return Padding(
              //     padding: const EdgeInsets.only(left: 12),
              //     child: Container(
              //       decoration: BoxDecoration(
              //         color: Colors.grey[300]!,
              //         borderRadius:
              //             const BorderRadius.all(Radius.circular(8)),
              //       ),
              //       width: double.infinity,
              //       height: 320,
              //     ),
              //   );
              // },
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const Labeler(text: "Yummy Name", textColor: Colors.orange),
                    const SizedBox(height: 6),
                    Text(
                      mealName,
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 23,
                        height: 1.2,
                        fontWeight: FontWeight.w600,
                        color: Colors.orange,
                      ),
                    ),
                    const SizedBox(height: 32),
                    const Labeler(text: "Description"),
                    const SizedBox(height: 6),
                    Text(
                      desc,
                      maxLines: 7,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 17,
                        height: 1.2,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 26),
                    const Labeler(text: "Category"),
                    const SizedBox(height: 6),
                    Text(
                      category,
                      style: const TextStyle(
                        color: Colors.orange,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 26),
                    const Labeler(text: "Price"),
                    const SizedBox(height: 6),
                    Text(
                      "\$ $price",
                      style: const TextStyle(
                        color: Colors.orange,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 26),
                    const Labeler(text: "Rating"),
                    const SizedBox(height: 6),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.only(left: 12),
                        width: 60,
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(right: 5),
                              child: Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 20,
                              ),
                            ),
                            Text(
                              "5",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    /* Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Category: ",
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                        Text(
                          category,
                          style: const TextStyle(
                            color: Colors.orange,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Price",
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                        Text(
                          "\$ $price",
                          style: const TextStyle(
                              color: Colors.orange,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16), */
                    /* SizedBox(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(right: 5),
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 15,
                                ),
                              ),
                              Text(
                                "5",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                   */
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class Labeler extends StatelessWidget {
  const Labeler({
    Key? key,
    required this.text,
    this.textColor,
  }) : super(key: key);

  final String text;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 8),
            width: 60,
            height: 2,
            color: Colors.grey[300],
          ),
          Text(
            text,
            maxLines: 7,
            style: TextStyle(
              fontSize: 13,
              height: 1.2,
              color: textColor ?? Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 8),
            width: 60,
            height: 2,
            color: Colors.grey[300],
          ),
        ],
      ),
    );
  }
}

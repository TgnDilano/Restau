import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({
    Key? key,
    required this.productName,
    required this.category,
    required this.price,
    required this.desc,
    required this.imgUrl,
  }) : super(key: key);

  final String productName;
  final String category;
  final String price;
  final String desc;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12).copyWith(top: 12),
        child: Column(
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
              child: Image.network(
                imgUrl,
                width: double.infinity,
                height: 320,
                errorBuilder: (context, _, trace) {
                  return Container();
                },
                loadingBuilder: (ctx, _, trace) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300]!,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                      ),
                      width: double.infinity,
                      height: 320,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Text(
              productName,
              maxLines: 3,
              style: const TextStyle(
                fontSize: 23,
                height: 1.2,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            Row(
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
            const SizedBox(height: 16),
            SizedBox(
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
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget generateContent(String productName, String Category, String price) {
    return Padding(
      padding: const EdgeInsets.only(),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildDescrption("ggeggeg"),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildDescrption(String desc) {
    return Container(
      height: 200,
      padding: EdgeInsets.only(bottom: 10),
      child: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: <Widget>[
            Text("$desc \n\n\n\n"),
          ],
        ),
      ),
    );
  }
}

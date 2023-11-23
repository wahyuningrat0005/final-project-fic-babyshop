
import 'package:baby_shop/common/components/space_height.dart';
import 'package:baby_shop/common/components/text/more_text.dart';
import 'package:flutter/material.dart';

import '../../common/components/form/button/button.dart';

class ProdutDetailView extends StatefulWidget {
  // final Map item;
  const ProdutDetailView({
    Key? key,
    // required this.item,
  });

  @override
  State<ProdutDetailView> createState() => _ProdutDetailViewState();
}

class _ProdutDetailViewState extends State<ProdutDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Detail"),
        centerTitle: true,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_outline,
              size: 24.0,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 260.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/crm1.png"),
                  fit: BoxFit.contain,
                ),
                color: Color.fromARGB(255, 52, 203, 10),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SpaceHeight(12.0),
                  Center(
                    child: Text(
                      "Body Lotion",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SpaceHeight(8.0),
                  /*   Text(
                    "Category",
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  const SpaceHeight(8.0),
                  QcategoryPicker(
                    label: "Size",
                    items: [
                      {"label": "S", "value": "S"},
                      {"label": "M", "value": "M"},
                      {"label": "L", "value": "L"},
                    ],
                    titleStyle:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    onChanged: (index, label, value, item) {},
                  ),
                  const SpaceHeight(8.0),
                  QcategoryPicker(
                    label: "Sugar",
                    items: [
                      {
                        "label": "Normal",
                      },
                      {
                        "label": "Sedang",
                      },
                      {
                        "label": "Besar",
                      },
                    ],
                    titleStyle: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    onChanged: (index, label, value, item) {},
                  ),*/

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 120.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          color: Colors.green,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.add),
                            ),
                            Text(
                              "2",
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.add),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "\$.53",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                  const SpaceHeight(8.0),
                  Text(
                    "Deskription",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  const SpaceHeight(8.0),
                  MoreText(
                    text:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  const SpaceHeight(8.0),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Wrap(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Price",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    const SpaceHeight(4.0),
                    Text(
                      "\$.53",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
                const SpaceWidth(20.0),
                Expanded(
                  child: QButton(label: "Add to Cart", onPressed: () {}),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

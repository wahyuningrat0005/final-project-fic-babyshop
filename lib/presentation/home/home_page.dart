import 'package:baby_shop/common/components/form/category_picker/category_picker.dart';
import 'package:baby_shop/common/components/searchfield/search_field.dart';
import 'package:baby_shop/common/components/space_height.dart';
import 'package:baby_shop/presentation/home/bloc/product_bloc.dart';
import 'package:baby_shop/presentation/home/widget/home_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widget/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            SafeArea(
              child: Container(
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: SafeArea(
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Location",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Lombok, NTB",
                                              style: TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Icon(
                                              Icons.chevron_right,
                                              size: 18.0,
                                              color: Colors.black,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 48.0,
                                    width: 48.0,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          "https://i.ibb.co/PGv8ZzG/me.jpg",
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8.0),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SpaceHeight(12.0),
                              SearchField(
                                hint: "Search",
                                onChanged: (value) {},
                              ),
                              const SpaceHeight(20.0),
                              const HomeBanner(),
                              const SpaceHeight(20.0),
                              Container(
                                color: Colors.white,
                                padding: EdgeInsets.only(right: 20),
                                child: Column(
                                  children: [
                                    QcategoryPicker(
                                        items: const [
                                          {
                                            "label": "Lotion",
                                            "value": "Lotion",
                                          },
                                          {
                                            "label": "Clothes",
                                            "value": "Clothes",
                                          },
                                          {
                                            "label": "Shoes",
                                            "value": "Shoes",
                                          },
                                          {
                                            "label": "Hospital Bag",
                                            "value": "Hospital Bag",
                                          },
                                          {
                                            "label": "Pempers",
                                            "value": "Pempers",
                                          },
                                        ],
                                        label: "Category",
                                        onChanged:
                                            (index, label, value, item) {})
                                  ],
                                ),
                              ),
                              const SpaceHeight(20.0),
                              BlocBuilder<ProductBloc, ProductState>(
                                builder: (context, state) {
                                  return state.maybeWhen(orElse: () {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }, loaded: (model) {
                                    return GridView.builder(
                                      padding: EdgeInsets.zero,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: 1.0 / 1.4,
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 8,
                                        crossAxisSpacing: 8,
                                      ),
                                      itemCount: 4,
                                      shrinkWrap: true,
                                      physics:const ScrollPhysics(),
                                      itemBuilder:
                                          (BuildContext context, int index) => ProductCard(data: model.data[index])
                                        //var item = controller.products[index];
                                        
                                      
                                    );
                                  });
                                },
                              )
                              /* LayoutBuilder(builder: (context, constraint) {
                                int crossAxisCount =
                                    (MediaQuery.of(context).size.width / 160)
                                        .floor();
                                return GridView.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 1.0 / 1.6,
                                      crossAxisCount: crossAxisCount,
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10,
                                    ),
                                    itemCount: 2,
                                    shrinkWrap: true,
                                    physics: ScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                child: Container(
                                              color: Colors.green,
                                            ))
                                          ],
                                        ),
                                      );
                                    });
                              })*/
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

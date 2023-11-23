import 'package:baby_shop/common/constants/variabels.dart';
import 'package:baby_shop/common/extentions/money_format/usd.dart';
import 'package:baby_shop/data/models/responses/product_response_model.dart';
import 'package:flutter/material.dart';

import '../../../common/components/space_height.dart';
import '../../product_detail/product_detail_view.dart';

class ProductCard extends StatelessWidget {
  final Product data;
  const ProductCard({
    super.key, required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProdutDetailView()));
      },
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          color: Colors.green,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('${Variabels.baseUrl}${data.attributes.images.data.first.attributes.url}'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius:const BorderRadius.all(
                    Radius.circular(
                      8.0,
                    ),
                  ),
                ),
                child: const Stack(
                  children: [
                    Positioned(
                      right: 10.0,
                      top: 8.0,
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                        size: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.attributes.name,
                    style:const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                
                  Row(
                    children: [
                       Expanded(
                        child: Text(
                        int.parse(data.attributes.price).currencyFormatUsd,
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        height: 32.0,
                        width: 32.0,
                        color: Colors.green,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(0.0),
                            ),
                            child: const Icon(
                              Icons.add,
                              size: 24.0,
                            )),
                      ),
                    ],
                  ),
                  const SpaceHeight(15.0)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

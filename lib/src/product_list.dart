import 'package:flutter/material.dart';

import 'product.dart';
import 'product_details.dart';

final List<Product> listProduct = [
  Product(
      "Quần jean",
      "https://cdn.shopify.com/s/files/1/0268/7841/0824/products/1053SS-white_1900x_crop_center_141b7f52-8fcb-4127-8025-3a27fcb314e8_720x.jpg?v=1618506001",
      "\$5.6",
      false),
  Product(
      "Áo kitty",
      "https://i.ebayimg.com/images/g/scAAAOSw10tgkxBI/s-l300.jpg",
      "\$9.8",
      false),
  Product(
      "Quần ống",
      "https://detmaythaihoa.com/wp-content/uploads/2021/05/quan-tay-ong-rong-ystore-1.jpg",
      "\$5.4",
      false),
  Product(
      "Áo thun",
      "https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/434247/item/goods_00_434247.jpg?width=1600&impolicy=quality_75",
      "\$5.4",
      false),
];

class ListProduct extends StatefulWidget {
  const ListProduct({Key? key}) : super(key: key);

  @override
  _ListProductState createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        title: Text("My Shop"),
        backgroundColor: Color(0xFF9C27B0),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
              )),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: GridView(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: [
          for (int i = 0; i < listProduct.length; i++)
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (c) =>  ProductDetails(listProduct[i])));
              },
              child: ProductItem(
                product: listProduct[i],
              ),
            )
        ],
      ),
    );
  }
}

class ProductItem extends StatefulWidget {
  final Product product;
  const ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  _ProductItemState createState() => _ProductItemState(product);
}

class _ProductItemState extends State<ProductItem> {
  final Product product;
  _ProductItemState(this.product);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(8),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.network(
              product.image,
              height: 300,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16.0),
                    bottomRight: Radius.circular(16.0))),
            height: 50,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      product.favorite = !product.favorite;
                    });
                  },
                  icon: Icon(
                    product.favorite ? Icons.favorite : Icons.favorite_border,
                    color: Color(0xFF9F28B4),
                  ),
                ),
                Expanded(
                  child: Text(
                    product.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontStyle: FontStyle.normal),
                  ),
                  flex: 1,
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Color(0xFF9F28B4),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

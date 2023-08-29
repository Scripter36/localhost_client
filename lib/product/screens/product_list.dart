import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:localhost/product/models/products.dart';
import 'package:localhost/product/widgets/product_list_item.dart';

class ProductListPage extends ConsumerStatefulWidget {
  const ProductListPage({super.key});

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends ConsumerState<ProductListPage> {
  @override
  Widget build(BuildContext context) {
    int itemCount = ref.watch(productsProvider.select((value) => value.length));
    // print itemCount
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none))
        ],
      ),
      body: SafeArea(
        child: ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, index) => ProductListItem(index),
            separatorBuilder: (context, index) => const Divider(
                  indent: 16,
                  endIndent: 16,
                  height: 1,
                ),
            itemCount: itemCount),
      ),
    );
  }
}

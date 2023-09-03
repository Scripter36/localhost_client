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
  late TextEditingController _locationSelectController;

  @override
  void initState() {
    super.initState();
    _locationSelectController = TextEditingController();
    _locationSelectController.text = '서원동';
  }

  @override
  void dispose() {
    _locationSelectController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int itemCount = ref.watch(productsProvider.select((value) => value.length));
    // print itemCount
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: AppBar(
          title: DropdownMenu(
            // TODO: Flutter가 수정해주지 않는다면 DropdownMenu를 직접 구현하여 애니메이션을 넣어주자
            controller: _locationSelectController,
            dropdownMenuEntries: const [
              DropdownMenuEntry(value: '서원동', label: '서원동'),
              DropdownMenuEntry(value: '행운동', label: '행운동'),
            ],
            inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
            ),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none))
          ],
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            RefreshIndicator.adaptive(
                child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      // trigger load more
                      if (index >= itemCount - 5) {
                        WidgetsBinding.instance
                            .addPostFrameCallback((_) => ref.read(productsProvider.notifier).loadMore());
                      }
                      return ProductListItem(index);
                    },
                    separatorBuilder: (context, index) => const Divider(
                          indent: 16,
                          endIndent: 16,
                          height: 1,
                        ),
                    itemCount: itemCount),
                onRefresh: () {
                  return ref.read(productsProvider.notifier).refresh();
                }),
            Positioned(
              bottom: 16,
              right: 16,
              child: FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
            )
          ],
        ),
      ),
    );
  }
}

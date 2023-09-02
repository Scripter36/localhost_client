import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:localhost/product/models/product.dart';
import 'package:localhost/product/models/products.dart';
import 'package:localhost/product/widgets/product_body.dart';
import 'package:localhost/utils/tweens.dart';

class ProductPage extends ConsumerStatefulWidget {
  final int productId;
  final String thumbnailUrl;
  final String title;
  final ProductState state;
  const ProductPage(this.productId, {Key? key, required this.thumbnailUrl, required this.title, required this.state})
      : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends ConsumerState<ProductPage> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var appLocalizations = AppLocalizations.of(context)!;
    final asyncProductData = ref.watch(ProductProvider(widget.productId));

    return Scaffold(
      appBar: AppBar(
        actions: [
          const SizedBox(width: 56),
          IconButton(
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            icon: const Icon(Icons.home_outlined),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              // TODO: share page url using native share sheet
            },
            icon: const Icon(Icons.share_outlined),
          ),
          MenuAnchor(
            menuChildren: [
              MenuItemButton(
                onPressed: () {},
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: min(MediaQuery.of(context).size.width, 150)),
                  child: Text(appLocalizations.report_product),
                ),
              ),
              MenuItemButton(
                onPressed: () {},
                child: Text(appLocalizations.block_user),
              ),
            ],
            builder: (context, controller, child) => IconButton(
              onPressed: () {
                if (controller.isOpen) {
                  controller.close();
                } else {
                  controller.open();
                }
              },
              icon: const Icon(Icons.more_vert),
              tooltip: MaterialLocalizations.of(context).showMenuTooltip,
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Stack(
              children: [
                Hero(
                  tag: 'product_image_${widget.productId}',
                  createRectTween: (begin, end) {
                    return RectCurveTween(begin: begin, end: end, curve: const Cubic(0.2, 0, 0, 1));
                  },
                  flightShuttleBuilder: (flightContext, animation, flightDirection, fromHeroContext, toHeroContext) {
                    final Hero toHero = toHeroContext.widget as Hero;
                    return AnimatedBorderRadiusContainer(
                      animation: animation,
                      from: 12,
                      to: 0,
                      child: toHero.child,
                    );
                  },
                  child: Image.network(
                    switch (asyncProductData) {
                      AsyncData(:final value) => value.imageUrls[0],
                      _ => widget.thumbnailUrl,
                    },
                    fit: BoxFit.cover,
                    frameBuilder: (context, child, frame, wasSynchronouslyLoaded) => Stack(
                      children: [Image.network(widget.thumbnailUrl, fit: BoxFit.cover, width: double.infinity), child],
                    ),
                    width: double.infinity,
                  ),
                ),
                // gradient overlay at app bar
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.center,
                        colors: [
                          Colors.black.withOpacity(0.5),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: switch (asyncProductData) {
              AsyncData(:final value) => ProductBody(value),
              _ => const SizedBox.shrink(), // TODO: show shimmer
            },
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
    );
  }
}

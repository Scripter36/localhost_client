import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:localhost/product/models/product.dart';
import 'package:localhost/product/models/products.dart';
import 'package:localhost/product/widgets/product_body.dart';
import 'package:localhost/utils/colors.dart';
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
  late ScrollController _scrollController;
  double _appBarOpacity = 0;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.offset > 0) {
        setState(() {
          _appBarOpacity = min(1, _scrollController.offset / 100);
        });
      } else {
        setState(() {
          _appBarOpacity = 0;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var appLocalizations = AppLocalizations.of(context)!;
    final asyncProductData = ref.watch(ProductProvider(widget.productId));

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                tooltip: MaterialLocalizations.of(context).backButtonTooltip,
              );
            },
          ),
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
          foregroundColor: _appBarOpacity > 0.5 ? theme.colorScheme.onSurface : Colors.white,
          backgroundColor: theme.colorScheme.surface.withOpacity(_appBarOpacity),
          scrolledUnderElevation: 0,
          elevation: 0,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: Stack(
                      children: [
                        Image.network(
                          switch (asyncProductData) {
                            AsyncData(:final value) => value.imageUrls[0],
                            _ => widget.thumbnailUrl,
                          },
                          fit: BoxFit.cover,
                          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) => Stack(
                            children: [
                              Image.network(widget.thumbnailUrl, fit: BoxFit.cover, width: double.infinity),
                              child
                            ],
                          ),
                          width: double.infinity,
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
            ),
          ),
          Hero(
            tag: 'bottom_navigation_bar',
            flightShuttleBuilder: (flightContext, animation, flightDirection, fromHeroContext, toHeroContext) {
              // fade between two app bars
              var toHeroWidget = toHeroContext.widget as Hero;
              var fromHeroWidget = fromHeroContext.widget as Hero;
              return Stack(
                children: [
                  Positioned.fill(
                    child: FadeTransition(
                      opacity: animation,
                      child: flightDirection == HeroFlightDirection.push ? toHeroWidget.child : fromHeroWidget.child,
                    ),
                  ),
                  Positioned.fill(
                    child: FadeTransition(
                      opacity: animation.drive(Tween(begin: 1, end: 0)),
                      child: flightDirection == HeroFlightDirection.push ? fromHeroWidget.child : toHeroWidget.child,
                    ),
                  ),
                ],
              );
            },
            createRectTween: (begin, end) {
              return RectCurveTween(begin: begin, end: end, curve: const Cubic(0.2, 0, 0, 1));
            },
            child: Container(
              color: ColorPolyfill.getSurfaceContainer(theme.colorScheme.brightness),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
                    VerticalDivider(width: 1, indent: 16, endIndent: 16),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: switch (asyncProductData) {
                            AsyncData(:final value) => [
                                Text(appLocalizations.product_detail_price(value.remainPrice, value.price),
                                    style: theme.textTheme.titleMedium
                                        ?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
                                Text(
                                    appLocalizations.product_detail_price_sub(
                                        value.remainPrice / value.pricePerStandardUnit * value.standardUnitAmount,
                                        value.price / value.pricePerStandardUnit * value.standardUnitAmount,
                                        value.standardUnitAmount,
                                        value.unit,
                                        value.pricePerStandardUnit),
                                    style: theme.textTheme.labelLarge
                                        ?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
                              ],
                            _ => [
                                const SizedBox.shrink(), // TODO: show shimmer
                                const SizedBox.shrink(), // TODO: show shimmer
                              ],
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: FilledButton(
                        child: Text(appLocalizations.product_detail_participate),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
    );
  }
}

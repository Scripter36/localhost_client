import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:localhost/product/models/products.dart';
import 'package:localhost/product/widgets/product_state_badge.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jiffy/jiffy.dart';

class ProductListItem extends ConsumerWidget {
  final int index;
  const ProductListItem(this.index, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var appLocalizations = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    ProductListItemData data = ref.watch(productsProvider.select((value) => value[index]));
    return InkWell(
      child: Padding(
          padding: const EdgeInsets.all(16),
          child: Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    data.thumbnailUrl,
                    width: 100,
                    height: 100,
                    frameBuilder: (context, child, frame, wasSynchronouslyLoaded) => Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surfaceVariant,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: child,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text.rich(
                            TextSpan(children: [
                              if (data.state != ProductState.normal)
                                WidgetSpan(
                                  child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 6, 0),
                                      child: ProductStateBadge(data.state, ignoreScaleFactor: true)),
                                  alignment: PlaceholderAlignment.middle,
                                ),
                              TextSpan(text: data.title, style: Theme.of(context).textTheme.titleMedium)
                            ]),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis),
                        const SizedBox(height: 2),
                        Text(
                          '${data.location} · ${Jiffy.parseFromDateTime(data.createdAt).from(Jiffy.now())}',
                          style: theme.textTheme.labelMedium?.copyWith(color: theme.colorScheme.secondary),
                        ),
                        const SizedBox(height: 4),
                        Text.rich(TextSpan(
                          text: appLocalizations.product_item_price(data.remainPrice, data.price),
                          style: Theme.of(context).textTheme.bodyMedium,
                          children: [
                            TextSpan(
                              text:
                                  ' (${appLocalizations.price_per_unit(data.pricePerStandardUnit, data.standardUnitAmount, data.unit)})',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ],
                        )),
                        // const Spacer(),
                        const SizedBox(height: 16) // for bottom state bar
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Text.rich(TextSpan(children: [
                  WidgetSpan(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 1, 0),
                      child: Icon(Icons.favorite_outline,
                          color: theme.colorScheme.secondary, size: theme.textTheme.labelMedium?.fontSize),
                    ),
                    alignment: PlaceholderAlignment.middle,
                  ),
                  TextSpan(
                      text: data.favoriteCount.toString(),
                      style: theme.textTheme.labelMedium?.copyWith(color: theme.colorScheme.secondary)),
                  const WidgetSpan(child: SizedBox(width: 4)),
                  WidgetSpan(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 1, 0),
                      child: Icon(Icons.person_outline,
                          color: theme.colorScheme.secondary, size: theme.textTheme.labelMedium?.fontSize),
                    ),
                    alignment: PlaceholderAlignment.middle,
                  ),
                  TextSpan(
                      text: data.participantCount.toString(),
                      style: theme.textTheme.labelMedium?.copyWith(color: theme.colorScheme.secondary)),
                ])),
              )
            ],
          )),
      onTap: () {},
    );
  }
}

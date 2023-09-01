import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:localhost/product/models/product_detail.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductBody extends StatelessWidget {
  final ProductData productData;

  const ProductBody(this.productData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appLocalizations = AppLocalizations.of(context)!;
    var theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(productData.authorProfileImageUrl, width: 40, height: 40),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(productData.authorName, style: theme.textTheme.titleSmall),
                  Text(productData.location,
                      style: theme.textTheme.labelMedium?.copyWith(color: theme.colorScheme.secondary)),
                ],
              ),
              const Spacer(),
              const SizedBox(width: 8),
              // rate
              Text.rich(
                TextSpan(
                  children: [
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                        child: Icon(Icons.star_border, size: theme.textTheme.bodyMedium?.fontSize),
                      ),
                      alignment: PlaceholderAlignment.middle,
                    ),
                    TextSpan(
                        text: appLocalizations.product_detail_rating_short(
                            productData.authorRating, productData.authorRatingCount),
                        style: theme.textTheme.bodyMedium),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 1, indent: 16, endIndent: 16),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(productData.title, style: theme.textTheme.titleMedium),
              const SizedBox(height: 2),
              Text(
                '${productData.category.localize(appLocalizations)} · ${Jiffy.parseFromDateTime(productData.createdAt).from(Jiffy.now())}',
                style: theme.textTheme.labelMedium?.copyWith(color: theme.colorScheme.secondary),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(productData.content, style: theme.textTheme.bodyMedium),
              const SizedBox(height: 32),
              if (productData.desiredLocationName != null) ...[
                Row(
                  children: [
                    Text(appLocalizations.product_detail_desired_location, style: theme.textTheme.titleSmall),
                    const Spacer(),
                    Text(productData.desiredLocationName!, style: theme.textTheme.bodyMedium),
                  ],
                ),
                // TODO: integrate google map
                Text(appLocalizations.product_detail_location_distance(200, "m")) // TODO: integrate GPS
              ],
              const SizedBox(height: 32),
              Text(
                "${appLocalizations.product_detail_participants(productData.participantCount)} · "
                "${appLocalizations.product_detail_favorites(productData.favoriteCount)} · "
                "${appLocalizations.product_detail_views(productData.viewCount)}",
                style: theme.textTheme.labelMedium?.copyWith(color: theme.colorScheme.secondary),
              )
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Divider(height: 1, indent: 16, endIndent: 16),
      ],
    );
  }
}

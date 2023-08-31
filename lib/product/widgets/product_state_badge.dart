import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:localhost/product/models/products.dart';

class ProductStateBadge extends StatelessWidget {
  final ProductState state;
  final bool ignoreScaleFactor;
  const ProductStateBadge(this.state, {super.key, this.ignoreScaleFactor = false});

  @override
  Widget build(BuildContext context) {
    var appLocalizations = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: state == ProductState.finished ? theme.colorScheme.surfaceVariant : theme.colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
          state == ProductState.normal
              ? ''
              : state == ProductState.completeMatching
                  ? appLocalizations.product_state_complete_matching
                  : state == ProductState.completePurchase
                      ? appLocalizations.product_state_complete_buying
                      : appLocalizations.product_state_finished,
          style: theme.textTheme.labelMedium?.copyWith(
              fontSize: ignoreScaleFactor
                  ? theme.textTheme.labelMedium!.fontSize! / MediaQuery.of(context).textScaleFactor
                  : theme.textTheme.labelMedium!.fontSize,
              color: state == ProductState.finished
                  ? theme.colorScheme.onSurfaceVariant
                  : theme.colorScheme.onTertiaryContainer)),
    );
  }
}

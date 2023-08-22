import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum ProductState {
  normal,
  completeMatching,
  completePurchase,
  finished,
}

class ProductStateBadge extends StatelessWidget {
  final ProductState state;
  const ProductStateBadge(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    var appLocalizations = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: state == ProductState.finished
            ? Theme.of(context).colorScheme.surfaceVariant
            : Theme.of(context).colorScheme.tertiaryContainer,
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
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: state == ProductState.finished
                  ? Theme.of(context).colorScheme.onSurfaceVariant
                  : Theme.of(context).colorScheme.onTertiaryContainer)),
    );
  }
}

// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/currency/exchange.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/routes/abstract_page.dart';
import 'package:app_finance/widgets/budget/budget_widget.dart';
import 'package:flutter/material.dart';

class BudgetPage extends AbstractPage {
  final String? search;
  BudgetPage({
    this.search,
  }) : super();

  @override
  BudgetPageState createState() => BudgetPageState();
}

class BudgetPageState extends AbstractPageState<BudgetPage> {
  @override
  String getTitle() {
    if (widget.search != null) {
      return AppLocale.labels.search(widget.search!);
    }
    return AppLocale.labels.budgetHeadline;
  }

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    NavigatorState nav = Navigator.of(context);
    return FloatingActionButton(
      heroTag: 'budget_page',
      onPressed: () => nav.pushNamed(AppRoute.budgetAddRoute),
      tooltip: AppLocale.labels.addBudgetTooltip,
      child: const Icon(Icons.add),
    );
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    dynamic items;
    if (widget.search != null) {
      final scope =
          super.state.getList(AppDataType.budgets).where((e) => e.title.toString().startsWith(widget.search!)).toList();
      final ex = Exchange(store: super.state);
      items = (
        total: scope.fold(0.0, (v, e) => v + ex.reform(e.details, e.currency, ex.getDefaultCurrency())),
        list: scope
      );
    } else {
      items = super.state.get(AppDataType.budgets);
    }
    return Column(
      children: [
        BudgetWidget(
          margin: EdgeInsets.all(ThemeHelper.getIndent()),
          title: AppLocale.labels.budgetHeadline,
          state: items,
          width: ThemeHelper.getWidth(context, 2),
        )
      ],
    );
  }
}

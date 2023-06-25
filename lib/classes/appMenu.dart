// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/classes/appMenuItem.dart';
import 'package:app_finance/classes/appRoute.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class AppMenu {
  BuildContext context;
  AppLocalizations? locale;

  AppMenu({required this.context}) {
    locale = AppLocalizations.of(context);
  }

  String uuid(String route, String uuid) {
    return route.replaceAll('uuid:', 'uuid:$uuid');
  }

  AppMenuItem getByIndex(int index) {
    return get()[index];
  }

  List<AppMenuItem> get() {
    return [
      AppMenuItem(
        name: locale!.homeHeadline,
        icon: Icons.home,
        route: AppRoute.homeRoute,
      ),
      AppMenuItem(
        name: locale!.goalHeadline,
        icon: Icons.star,
        route: AppRoute.homeRoute,
      ),
      AppMenuItem(
        name: locale!.accountHeadline,
        icon: Icons.credit_card,
        route: AppRoute.accountRoute,
      ),
      AppMenuItem(
        name: locale!.budgetHeadline,
        icon: Icons.calendar_month,
        route: AppRoute.budgetRoute,
      ),
      AppMenuItem(
        name: locale!.billHeadline,
        icon: Icons.money_off,
        route: AppRoute.homeRoute,
      ),
      AppMenuItem(
        name: locale!.metricsHeadline,
        icon: Icons.timeline,
        route: AppRoute.homeRoute,
      ),
      AppMenuItem(
        name: locale!.settingsHeadline,
        icon: Icons.settings,
        route: AppRoute.homeRoute,
      ),
    ];
  }
}

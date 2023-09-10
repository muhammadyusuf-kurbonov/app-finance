// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/routes/abstract_page.dart';
import 'package:app_finance/widgets/_wrappers/tab_widget.dart';
import 'package:app_finance/widgets/settings/import_tab.dart';
import 'package:app_finance/widgets/settings/setting_tab.dart';
import 'package:app_finance/widgets/settings/recover_tab.dart';
import 'package:flutter/material.dart';

class SettingsPage extends AbstractPage {
  const SettingsPage({super.key});

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends AbstractPageState<SettingsPage> {
  @override
  String getButtonName() => '';

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    return ThemeHelper.emptyBox;
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    return TabWidget(
      focus: 0,
      tabs: [
        Tab(
          icon: const Icon(Icons.settings),
          text: AppLocale.labels.settingsBaseHeadline,
        ),
        Tab(
          icon: const Icon(Icons.health_and_safety),
          text: AppLocale.labels.recoveryHeadline,
        ),
        Tab(
          icon: const Icon(Icons.imagesearch_roller_sharp),
          text: AppLocale.labels.importHeadline,
        ),
      ],
      children: [
        SettingTab(),
        RecoverTab(callback: super.state.restate),
        ImportTab(width: ThemeHelper.getWidth(context, 12), textTheme: Theme.of(context).textTheme),
      ],
    );
  }

  @override
  String getTitle() {
    return AppLocale.labels.settingsHeadline;
  }
}

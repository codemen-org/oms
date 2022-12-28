import 'package:flutter/material.dart';
import 'package:plix/provider/catpopup_status.dart';
import 'package:provider/provider.dart';
import '../provider/hide_appbar_provider.dart';

appBarName({required String name, required BuildContext context}) {
  AppBarNameProvider appBarName =
      Provider.of<AppBarNameProvider>(context, listen: false);
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    appBarName.changename(name);
  });
}

hideAppBarName({required bool val, required BuildContext context}) {
  HideAppBarProvider appBarName =
      Provider.of<HideAppBarProvider>(context, listen: false);
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    appBarName.changeval(val);
  });
}
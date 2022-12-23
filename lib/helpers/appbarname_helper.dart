import 'package:flutter/material.dart';
import 'package:plix/provider/catpopup_status.dart';
import 'package:provider/provider.dart';

appBarName({required String name, required BuildContext context}) {
  AppBarNameProvider appBarName =
      Provider.of<AppBarNameProvider>(context, listen: false);
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    appBarName.changename(name);
  });
}

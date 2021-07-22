import 'package:flutter/material.dart';

import '../widgets/buttons.dart' as buttons;
import '../widgets/search.dart' as search;

class SearchSpace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        buttons.MyButtons(),
        search.MySearch(),
      ],
    );
  }
}

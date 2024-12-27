import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:task2/core/view_models/home_viewmodel.dart';
import 'package:task2/core/view_models/single_goal_viewmodel.dart';

class MyProviders {
  static List<SingleChildWidget> allProviders = [
    ChangeNotifierProvider(create: (context) => HomeViewmodel()),
    ChangeNotifierProvider(create: (context) => SingleGoalViewmodel()),
  ];
}

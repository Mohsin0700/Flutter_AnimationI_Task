import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task2/core/view_models/home_viewmodel.dart';
import 'package:task2/shared/constants/app_constants.dart';
import 'package:task2/ui/views/single_goal_view.dart';
import 'package:task2/ui/widgets/custom_container.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstants.primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(08.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Goals",
                      style:
                          TextStyle(fontSize: 36, fontWeight: FontWeight.w900),
                    ),
                    Icon(
                      Icons.add_circle_outline,
                      size: 35,
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Consumer<HomeViewmodel>(builder: (context, vm, child) {
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: vm.allGoals.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> goal = vm.allGoals[index];

                        double perc =
                            ((goal["savings"] * 100) / goal["totalCost"]);
                        int percentage = perc.round();
                        Color containerColor;
                        if (percentage <= 50) {
                          containerColor = AppConstants.below50;
                        } else if (percentage > 50 && percentage < 100) {
                          containerColor = AppConstants.above50;
                        } else {
                          containerColor = AppConstants.doneColor;
                        }
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => SingleGoalView(
                                          goal: goal,
                                          bg: containerColor,
                                          percentage: percentage,
                                        )));
                          },
                          child: CustomContainer(
                            goalName: goal["goalName"],
                            totalCost: goal["totalCost"],
                            savings: goal["savings"],
                            category: goal["category"],
                            percentage: percentage,
                            color: containerColor,
                          ),
                        );
                      });
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

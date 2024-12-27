import 'package:flutter/material.dart';

class SingleGoalView extends StatelessWidget {
  final Map<String, dynamic> goal;
  final Color bg;
  final int percentage;
  const SingleGoalView(
      {super.key,
      required this.goal,
      required this.bg,
      required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Stack(children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0, end: percentage.toDouble()),
                    duration: Duration(milliseconds: 2000),
                    builder: (context, value, child) {
                      return Text(
                        '${value.toStringAsFixed(0)}%',
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 50),
                      );
                    },
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all<Color>(Colors.black)),
                      onPressed: () {},
                      child: Text(
                        "Replenish",
                        style: TextStyle(color: bg),
                      ))
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: goal["months"]?.length ?? 0,
                itemBuilder: (context, index) {
                  Map<String, dynamic> thisMonth = goal["months"][index];
                  double thisMonthPercentage =
                      (thisMonth["savings"] * 100) / goal["totalCost"];
                  return TweenAnimationBuilder(
                      tween: Tween<double>(begin: 0, end: thisMonthPercentage),
                      duration: Duration(milliseconds: 2000),
                      builder: (context, value, child) {
                        return Row(children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.red.shade100,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(15),
                                      bottomRight: Radius.circular(15))),
                              margin: EdgeInsets.only(top: 5),
                              padding: EdgeInsets.all(10),
                              height: 50,
                              width: value * 3,
                              child: Text(thisMonth["month"] ?? "No Month",
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 20))),
                          SizedBox(width: 10),
                          Text('${value.toStringAsFixed(0)}%',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 25)),
                        ]);
                      });
                },
              ),
            ],
          ),
        ]),
      ),
      bottomSheet: Stack(
        children: [
          TweenAnimationBuilder(
              tween: Tween<double>(begin: 50, end: 300),
              duration: Duration(milliseconds: 1500),
              builder: (context, value, child) {
                return Container(
                  width: double.infinity,
                  color: Colors.green,
                  height: value,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Amount Collected", style: customStyle),
                        Text("\$${goal["savings"]} of \$${goal["totalCost"]} ",
                            style: customStyle),
                      ],
                    ),
                  ),
                );
              }),
          Positioned(
              bottom: 0,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: 1),
                  duration: Duration(milliseconds: 1500),
                  builder: (BuildContext context, value, child) {
                    return AnimatedOpacity(
                      opacity: value,
                      duration: Duration(milliseconds: 2000),
                      child: Text(
                        goal["goalName"],
                        maxLines: 3,
                        style: TextStyle(
                            fontSize: 50,
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            overflow: TextOverflow.ellipsis),
                      ),
                    );
                  },
                ),
              )),
        ],
      ),
    );
  }
}

TextStyle customStyle = TextStyle(color: Colors.white, fontSize: 14);

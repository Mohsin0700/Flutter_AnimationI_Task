import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String goalName;
  final int totalCost;
  final int savings;
  final String category;
  final int percentage;
  final Color color;
  const CustomContainer(
      {super.key,
      required this.goalName,
      required this.totalCost,
      required this.savings,
      required this.category,
      required this.percentage,
      required this.color});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return ClipPath(
      clipper: MyCustomClipper(),
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,
        ),
        height: 200,
        width: screenSize.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              goalName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              "\$$savings of \$$totalCost",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '#$category',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    '${percentage.toString()}%',
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 50),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Start at the top left corner
    path.moveTo(0, 0);

    // Draw the top line with a straight edge
    path.lineTo(size.width, 0); // Top right corner (same as before)

    // Draw the bottom right corner with 40 width
    path.lineTo(size.width - 20, size.height); // Bottom right slant

    // Draw the bottom left corner with 50 width
    path.lineTo(20, size.height); // Bottom left slant

    // Draw a straight line to the top left corner
    path.lineTo(0, 0); // Close the path back to the top left corner
    path.close(); // Close the path

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; // No need to reclip, static shape
  }
}

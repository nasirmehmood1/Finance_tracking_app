import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

/// A StatefulWidget that displays a custom pie chart.
class PieChartCustom extends StatefulWidget {
  const PieChartCustom(
      {super.key,
      required this.pieValue,
      required this.houseExpenses,
      required this.foodExpenses,
      required this.treveleExpenses,
      required this.luxuryExpense});
  final String pieValue;
  final double houseExpenses;
  final double foodExpenses;
  final double treveleExpenses;
  final double luxuryExpense;
  @override
  State<PieChartCustom> createState() => _PieChartCustomState();
}

/// The State class for PieChartCustom.
class _PieChartCustomState extends State<PieChartCustom> {
  int? touchedIndex;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PieChart(
            PieChartData(
              sections: _showingSections(),
              centerSpaceRadius: 90,
              pieTouchData: PieTouchData(
                touchCallback: (FlTouchEvent event, pieTouchResponse) {
                  setState(() {
                    if (event is FlTapUpEvent && pieTouchResponse != null) {
                      touchedIndex =
                          pieTouchResponse.touchedSection!.touchedSectionIndex;
                    } else {
                      touchedIndex = -1;
                    }
                  });
                },
              ),
            ),
          ),
          Text(
            widget.pieValue,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  /// Generates a list of PieChartSectionData to display sections of the pie chart.
  List<PieChartSectionData> _showingSections() {
    return List.generate(4, (i) {
      final bool isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 29.0 : 16.0;
      final double radius = isTouched ? 80.0 : 50.0;

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.blue,
            value: widget.foodExpenses,
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.green,
            value: widget.houseExpenses,
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.yellow,
            value: widget.treveleExpenses,
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 3:
          return PieChartSectionData(
            color: Colors.orange,
            value: widget.luxuryExpense,
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        default:
          throw Error();
      }
    });
  }
}

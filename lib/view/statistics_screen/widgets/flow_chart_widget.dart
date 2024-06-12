import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finance_app_ui_animation/model/month_model.dart';

class ExpensesChart extends StatelessWidget {
  ExpensesChart({super.key});
  final List<MonthModel> data = [
    MonthModel(month: 1, monthExpense: 129298274.0),
    MonthModel(month: 2, monthExpense: 8834568745.0),
    MonthModel(month: 3, monthExpense: 834655423.0),
    MonthModel(month: 4, monthExpense: 1297354.0),
    MonthModel(month: 5, monthExpense: 28875893.0),
    MonthModel(month: 6, monthExpense: 9923845.0),
    MonthModel(month: 7, monthExpense: 16274859.0),
    MonthModel(month: 8, monthExpense: 117236564.0),
    MonthModel(month: 9, monthExpense: 94859675.0),
    MonthModel(month: 10, monthExpense: 78267465.0),
    MonthModel(month: 11, monthExpense: 88765085.0),
    MonthModel(month: 12, monthExpense: 12253785.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: data
                  .map((point) => FlSpot(point.month.toDouble(),
                      point.monthExpense / 1000000)) // Scale down by 1,000,000
                  .toList(),
              isCurved: true,
              barWidth: 4,
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    Colors.blue.withOpacity(0.5),
                    Colors.blue.withOpacity(0.0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              dotData: FlDotData(
                show: true,
              ),
            ),
          ],
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (double value, TitleMeta meta) {
                  const style = TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  );
                  String text;
                  switch (value.toInt()) {
                    case 1:
                      text = 'Jan';
                      break;
                    case 2:
                      text = 'Feb';
                      break;
                    case 3:
                      text = 'Mar';
                      break;
                    case 4:
                      text = 'Apr';
                      break;
                    case 5:
                      text = 'May';
                      break;
                    case 6:
                      text = 'Jun';
                      break;
                    case 7:
                      text = 'Jul';
                      break;
                    case 8:
                      text = 'Aug';
                      break;
                    case 9:
                      text = 'Sep';
                      break;
                    case 10:
                      text = 'Oct';
                      break;
                    case 11:
                      text = 'Nov';
                      break;
                    case 12:
                      text = 'Dec';
                      break;
                    default:
                      return Container();
                  }
                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    child: Text(text, style: style),
                  );
                },
                interval: 1,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (double value, TitleMeta meta) {
                  return Text('${(value * 1000000).toInt()}',
                      style:
                          const TextStyle(color: Colors.black, fontSize: 12));
                },
                interval: 100, // Adjust this interval if needed
              ),
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: Colors.black, width: 1),
          ),
        ),
      ),
    );
  }
}

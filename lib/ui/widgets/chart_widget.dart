import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class LinechartWidget extends StatelessWidget {
  const LinechartWidget({super.key});

  List<FlSpot> _generateRandomInvestmentData() {
    final Random rng = Random();
    double value = 100;
    final List<FlSpot> spots = [];

    for (int i = 0; i < 7; i++) {
      value += rng.nextDouble() * 10 - 5;
      value = double.parse(value.toStringAsFixed(2));
      spots.add(FlSpot(i.toDouble(), value));
    }

    return spots;
  }

  @override
  Widget build(BuildContext context) {
    final List<FlSpot> data = _generateRandomInvestmentData();

    final bool isFalling = data.last.y < data.first.y;

    final Color lineColor = isFalling ? Colors.redAccent : Colors.greenAccent;
    final Color fillColor = isFalling ? Colors.redAccent.withValues(alpha: .2) : Colors.greenAccent.withValues(alpha: .2);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Histórico del fondo",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 220,
          child: LineChart(
            LineChartData(
              gridData: FlGridData(show: true),
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 24,
                    interval: 1,
                    getTitlesWidget: (value, meta) {
                      final days = ['Lun', 'Mar', 'Mié', 'Jue', 'Vie', 'Sáb', 'Dom'];
                      return Text(
                        days[value.toInt() % 7],
                        style: const TextStyle(color: Colors.white, fontSize: 10),
                      );
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 40,
                    interval: 5,
                    getTitlesWidget: (value, meta) {
                      return Text(
                        '\$${value.toStringAsFixed(0)}',
                        style: const TextStyle(color: Colors.white, fontSize: 10),
                      );
                    },
                  ),
                ),
                topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
              borderData: FlBorderData(show: true),
              minX: 0,
              maxX: 6,
              lineBarsData: [
                LineChartBarData(
                  isCurved: true,
                  color: lineColor,
                  barWidth: 3,
                  belowBarData: BarAreaData(
                    show: true,
                    color: fillColor,
                  ),
                  dotData: FlDotData(show: false),
                  spots: data,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

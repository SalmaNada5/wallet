// import 'package:flutter/material.dart';
// import 'payments_series.dart';
// import 'package:charts_flutter/flutter.dart' as charts;
//
// class PaymentsChart extends StatelessWidget {
//   const PaymentsChart({Key? key, @required this.data}) : super(key: key);
//   final List<PaymentSeries>? data;
//   @override
//   Widget build(BuildContext context) {
//     List<charts.Series<PaymentSeries, String>> series = [
//       charts.Series(
//         id: 'payments',
//         data: data!,
//         domainFn: (PaymentSeries series, _) => series.day!,
//         measureFn: (PaymentSeries series, _) => series.money,
//         colorFn: (PaymentSeries series, _) => series.barColor!,
//       ),
//     ];
//     return Expanded(
//       child: charts.BarChart(
//         series,
//         animate: true,
//       ),
//     );
//   }
// }

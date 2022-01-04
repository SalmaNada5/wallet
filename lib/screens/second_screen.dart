// import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_painter/chart.dart';
// import 'package:mange_your_wallet/chart/payments_chart.dart';
// import 'package:mange_your_wallet/chart/payments_series.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  // final List<PaymentSeries> data = [
  @override
  Widget build(BuildContext context) {
    Color barColor = const Color(0xffcbedff);
    // bool isSelected = false;
    int? selectedIndex;
    List values = [200, 250, 500, 420, 120, 320, 100];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff1ab4f4),
        elevation: 0,
        title: const Text(
          'Statistics',
          style: TextStyle(
            color: Colors.white54,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(
              top: 10,
              right: 10,
            ),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xffd3effe),
            ),
            child: const Icon(
              Icons.view_comfy_rounded,
              color: Colors.black,
            ),
          ),
        ],
        leading: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(top: 10, left: 10),
          width: 60,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color(0xffd3effe),
          ),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(120),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Total Balance',
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                '\$ 7,530.00',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                height: 20,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  color: Color(0xfff8fcff),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        color: const Color(0xfff8fcff),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.09,
                  decoration: BoxDecoration(
                    color: const Color(0xff1ab4f4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Text(
                    'INCOME',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.09,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Text(
                    'SPENDING',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.09,
                  decoration: BoxDecoration(
                    color: const Color(0xffdccf46),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Text(
                    'This Week',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            // PaymentsChart(data: data),

            Expanded(
              child: Chart(
                state: ChartState(
                  ChartData.fromList(
                    values.map((e) => BarValue<void>(e.toDouble())).toList(),
                    axisMax: 8,
                  ),
                  itemOptions: BarItemOptions(
                      color: barColor,
                      padding: const EdgeInsets.all(10),
                      radius: const BorderRadius.vertical(
                          top: Radius.circular(20),
                          bottom: Radius.circular(20))),
                  behaviour: ChartBehaviour(
                    onItemClicked: (int index) {
                      setState(() {
                        // barColor = isSelected
                        //     ? const Color(0xffcbedff)
                        //     : const Color(0xff1ab4f4);
                        // isSelected = !isSelected;
                        selectedIndex = index;
                      });
                    },
                  ),
                ),
              ),
            ),
            Row(
              children: const [
                Text(
                  'Period Report',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Text(
                  'view all',
                  style: TextStyle(
                    color: Color(0xff1ab4f4),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => const ListViewCard(),
                itemCount: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListViewCard extends StatelessWidget {
  const ListViewCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.white,
      elevation: 2,
      margin: const EdgeInsets.all(5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: Colors.black,
                ),
                color: Colors.white,
              ),
              child: const Icon(Icons.shopping_cart_outlined),
            ),
            const SizedBox(
              width: 5,
            ),
            const Text('Shopping'),
            const Spacer(),
            const Text(
              '-\$102.83',
              style: TextStyle(
                color: Colors.pink,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

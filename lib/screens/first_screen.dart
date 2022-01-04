import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff6fbfe),
      extendBody: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xfff6fbfe),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10, top: 10),
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: const Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
          ),
        ],
        leading: Container(
          margin: const EdgeInsets.only(left: 10, top: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: const Icon(
            Icons.settings,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: ListWheelScrollView.useDelegate(
                  itemExtent: 150,
                  childDelegate: ListWheelChildBuilderDelegate(
                    childCount: 4,
                    builder: (context, index) => Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: index == 0
                            ? const Color(0xffdccf44)
                            : index == 1
                                ? const Color(0xff8ccfec)
                                : const Color(0xff4dcb9e),
                      ),
                    ),
                  ),
                  perspective: 0.009,
                  diameterRatio: 3,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Featured',
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  FeaturedCard(
                      icon: Icon(Icons.transfer_within_a_station),
                      text: 'Transfer'),
                  FeaturedCard(
                      icon: Icon(Icons.monetization_on_rounded),
                      text: 'Deposit'),
                  FeaturedCard(icon: Icon(Icons.money), text: 'Top Up'),
                  FeaturedCard(icon: Icon(Icons.payments), text: 'Bill Pay'),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Transactions',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: null,
                    child: Text(
                      'View All',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 1,
                height: 0.001,
              ),
              Expanded(
                child: ListView(
                  itemExtent: 60,
                  children: const [
                    ListViewChild(
                      payment: Text(
                        '+\$1,205',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListViewChild(
                      payment: Text(
                        '-\$80',
                        style: TextStyle(
                            color: Colors.pink,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListViewChild(
                      payment: Text(
                        '-\$75',
                        style: TextStyle(
                          color: Colors.pink,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    ListViewChild(
                      payment: Text(
                        '-\$120',
                        style: TextStyle(
                            color: Colors.pink,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FeaturedCard extends StatelessWidget {
  const FeaturedCard({Key? key, required this.icon, required this.text})
      : super(key: key);
  final Icon? icon;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: const Color(0xfff6fbfe),
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: icon,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(text!),
      ],
    );
  }
}

class ListViewChild extends StatelessWidget {
  const ListViewChild({Key? key, @required this.payment}) : super(key: key);

  final Widget? payment;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage('images/profile.jpg'),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          children: const [
            Text(
              'Tuhin Suvro',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              'Payment Sent',
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            payment!,
            const SizedBox(
              height: 3,
            ),
            const Text(
              '02- Nov- 21',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

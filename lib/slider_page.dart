import 'package:flutter/material.dart';

class SliderPage extends StatelessWidget {
  const SliderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Easiest Way to',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
        Row(
          children: const [
            Text(
              'Manage Your ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            ),
            Text(
              'Wallet',
              style: TextStyle(color: Colors.blue, fontSize: 25),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Manage your account anytime anywhere. No'
              ' hassele for any kind of transition.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
        )
      ],
    );
  }
}

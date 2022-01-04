import 'package:flutter/material.dart';
import 'package:mange_your_wallet/slider_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;
  final PageController _controller = PageController();
  final List<Widget> _pages = const [
    SliderPage(),
    SliderPage(),
    SliderPage(),
  ];
  _onChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff86d4f9),
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.4,
          bottom: 10,
        ),
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width * 0.95,
            padding: const EdgeInsets.only(top: 30, right: 15, left: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
            ),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, 'myApp');
              },
              child: Stack(
                children: [
                  PageView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: _controller,
                      itemCount: 3,
                      onPageChanged: _onChanged,
                      itemBuilder: (context, index) {
                        return _pages[index];
                      }),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                            List<Widget>.generate(_pages.length, (int index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 40),
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: (index == _currentPage)
                                  ? Colors.blue
                                  : Colors.blue.withOpacity(0.5),
                            ),
                          );
                        }),
                      ),
                      InkWell(
                        onTap: () {
                          _controller.nextPage(
                              duration: const Duration(milliseconds: 800),
                              curve: Curves.easeInOutCirc);
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          alignment: Alignment.center,
                          height: 70,
                          width: _currentPage == _pages.length - 1 ? 200 : 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.blue,
                          ),
                          child: (_currentPage == _pages.length - 1)
                              ? GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, 'initScreen');
                                  },
                                  child: const Text(
                                    'Get Started',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                )
                              : const Icon(
                                  Icons.arrow_right_alt_sharp,
                                  color: Colors.white,
                                  size: 50,
                                ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

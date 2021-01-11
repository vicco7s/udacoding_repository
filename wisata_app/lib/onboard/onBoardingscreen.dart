import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wisata_app/util/count.dart';
import 'onBoardButton.dart';
import 'onboardingbody.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return Animated( //animated indicator in onboardingbutton.dart
      width: isActive ? 24.0 : 16.0,
      color: isActive ? bColorBlue : bColorgry,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () => print('Skip'),
                    child: Text('Skip',style: kSkipText),
                  ),
                ),
                BodyWidget(
                  control: _pageController,
                  onPagechng: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                _currentPage != _numPages - 1
                    ? Expanded(
                        child: NextPage( //onBoardButton Next Page
                          onTap: () {
                            _pageController.nextPage(
                              duration: Duration(milliseconds: 400),
                              curve: Curves.ease,
                            );
                          },
                        ),
                      )
                    : Text(''),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
              height: 100.0,
              width: double.infinity,
              color: Colors.white,
              child: ButtonOnboard( //onBoardButton.dart buttonOnboard
                onTap: () => print('Get Started'),
              ),
            )
          : Text(''),
    );
  }
}
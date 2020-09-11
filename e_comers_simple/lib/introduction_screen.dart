import 'package:e_comers_simple/constant/constant.dart';
import 'package:e_comers_simple/page/homepage.dart';
import 'package:e_comers_simple/page/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';



class IntroDuction extends StatefulWidget {
  @override
  _IntroDuctionState createState() => _IntroDuctionState();
}

class _IntroDuctionState extends State<IntroDuction> {
   final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => LoginPage()),
    );
  }

  Widget _buildImage(String imageName) {
    return Align(
      child: SvgPicture.asset('images/$imageName.svg', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration =  PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      // pageColor: Colors.black,
      imagePadding: EdgeInsets.zero,
    );
    return  Scaffold(
      body: IntroductionScreen(
        key: introKey,
        pages: [
          PageViewModel(
            title: "Belanja Mudah",
            body:"Daripada harus membeli secara offline, Beli aja dari Smartphone.",
            image: _buildImage('undraw_empty_cart_co35'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Lebih Cepat",
            body:"Unduh aplikasi _________ dan Beli secara Online cukup di tempat.",
            image: _buildImage('undraw_online_groceries_a02y'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "muda dan tua",
            body:"Cocok Bagi pengguna anak muda maupun orang tua lebih simple.",
            image: _buildImage('undraw_online_shopping_ga73'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Belanja nanti",
            body: "Belanja di tunda tidak masalah dan bayarnya nanti aja ",
            image: _buildImage('undraw_shopping_app_flsj'),
            footer: RaisedButton(
              onPressed: () {
                introKey.currentState?.animateScroll(0);
              },
              child: Text(
                'Baca kembali',
                style: TextStyle(color: Colors.white),
              ),
              color: kColorBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Sudah Siap",
            bodyWidget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Tekan Selesai Ke halaman baru", style: bodyStyle),
              ],
            ),
            image: _buildImage('undraw_shopping_eii3'),
            decoration: pageDecoration,
          ),
        ],
        onDone: () => _onIntroEnd(context),
        onSkip: () => _onIntroEnd(context), // You can override onSkip callback
        showSkipButton: true,
        skipFlex: 0,
        nextFlex: 0,
        skip: Text('Skip',),
        next: Icon(Icons.arrow_forward_ios,size: 20,),
        done: Text('Selesai', style: TextStyle(fontWeight: FontWeight.w600)),
        dotsDecorator: DotsDecorator(
          size: Size(10.0, 10.0),
          activeColor: kColorBlue,
          color: kColorGrey,
          activeSize: Size(22.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
      ),
    );
  }
}
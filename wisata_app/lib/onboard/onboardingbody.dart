import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wisata_app/util/count.dart';


class BodyWidget extends StatelessWidget {

  final PageController control;
  final Function onPagechng;

  BodyWidget ({
    this.control,
    this.onPagechng,
    });


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600.0,
      child: PageView(
        physics: ClampingScrollPhysics(),
        controller: control,
        onPageChanged: onPagechng,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Center(
                    child:SvgPicture.asset(
                      'images/one.svg',
                      height: 300.0,
                      width: 300.0,
                    )
                  ),
                ),
                SizedBox(height: 30.0),
                Text(
                  'Officia amet sint\neiusmod laborum.',
                  style: kTitleStyle,
                ),
                SizedBox(height: 15.0),
                Text(
                  'Eu sit ut eiusmod do. Nisi ut nulla qui deserunt in nostrud tempor eu deserunt. Mollit sit deserunt do dolor in dolor nisi do excepteur quis exercitation id dolor.',
                  style: kSubtitleStyle,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: SvgPicture.asset(
                      'images/two.svg',
                      height: 300.0,
                      width: 300.0,
                    )
                  ),
                ),
                SizedBox(height: 30.0),
                Text(
                  'Esse aliquip enim adipisicing',
                  style: kTitleStyle,
                ),
                SizedBox(height: 15.0),
                Text(
                  'Ea id cupidatat aliquip Lorem ipsum non aliqua et laborum velit commodo elit officia. Ad et quis duis anim. Aute Lorem reprehenderit aliquip eiusmod.',
                  style: kSubtitleStyle,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Center(
                    child:SvgPicture.asset(
                      'images/tri.svg',
                      height: 300.0,
                      width: 300.0,
                    )
                  ),
                ),
                SizedBox(height: 30.0),
                Text(
                  'Fugiat id laborum\neu sint ex.',
                  style: kTitleStyle,
                ),
                SizedBox(height: 15.0),
                Text(
                  'Reprehenderit sunt id irure Lorem sint Lorem aute commodo. In reprehenderit commodo magna sint amet do veniam enim ipsum nulla ad esse proident laboris.',
                  style: kSubtitleStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
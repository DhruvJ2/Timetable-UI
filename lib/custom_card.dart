import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(this._color, this._opacityColor, {Key? key})
      : super(key: key);
  final _color;
  final _opacityColor;
  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    var _theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.only(
        bottom: 30.0,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: InkWell(
        child: Container(
          height: _size.height * 0.15,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              15.0,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 13.0,
                decoration: BoxDecoration(
                  color: _color,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      bottomLeft: Radius.circular(
                        15.0,
                      )),
                ),
              ),
              Container(
                width: 85.0,
                decoration: BoxDecoration(
                  color: _opacityColor,
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text(
                        '09:45 AM',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          wordSpacing: 10.0,
                          fontSize: 18.0,
                        ),
                      ),
                      Text(
                        '24/06/2022 Thursday',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ]),
              ),
              Container(
                width: _size.width * 0.55,
                padding: const EdgeInsets.only(
                  left: 12.0,
                  right: 8.0,
                  top: 8.0,
                  bottom: 8.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Lorem Ipsum',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 22.0,
                        letterSpacing: 1.0,
                      ),
                    ),
                    const Text(
                      'Lorem ipsum is placeholder text commonly used ,...',
                      style: TextStyle(
                        fontSize: 14.0,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: const [
                        CircleAvatar(
                          radius: 14.0,
                          backgroundImage: NetworkImage(
                              'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.0l7k5zqRUVQ5Yq9eTpW2LgHaLJ%26pid%3DApi&f=1'),
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        Text(
                          'Dr. Ashwin Kunte',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w300,
                          ),
                        )
                      ],
                    )
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

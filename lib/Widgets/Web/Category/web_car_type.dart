import 'package:flutter/material.dart';

class WebCarType extends StatefulWidget {
  final String image;
  final String title;
  final String number;
  final Function onTap;
  const WebCarType({
    super.key,
    required this.image,
    required this.title,
    required this.number, required this.onTap,
  });

  @override
  _WebCarTypeState createState() => _WebCarTypeState();
}

class _WebCarTypeState extends State<WebCarType> {
  double _avatarRadius = 30.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15),
        MouseRegion(
          onEnter: (event) {
            setState(() {
              _avatarRadius = 40.0;
            });
          },
          onExit: (event) {
            setState(() {
              _avatarRadius = 30.0;
            });
          },
          child: InkWell(
            onTap: (){widget.onTap();},
            child: Row(
              children: [
                SizedBox(width: 20),
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(widget.image),
                    radius: _avatarRadius,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  widget.title,
                  style: TextStyle(
                    color: Color.fromRGBO(254, 127, 33, 1.0),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  widget.number,
                  style: TextStyle(
                    color: Color.fromRGBO(164, 164, 164, 1.0),
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 10),
          child: Divider(
            color: Colors.grey,
            thickness: 1,
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}

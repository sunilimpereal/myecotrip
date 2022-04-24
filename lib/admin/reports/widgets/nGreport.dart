import 'package:flutter/material.dart';
import 'package:myecotrip/constants/config.dart';

class NGReportCard extends StatefulWidget {
  const NGReportCard({Key? key}) : super(key: key);

  @override
  State<NGReportCard> createState() => _NGReportCardState();
}

class _NGReportCardState extends State<NGReportCard> {
  late double CardHeight;
  late double CardWidth;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    CardHeight = Config().deviceHeight(context) * 0.24;
    CardWidth = Config().deviceWidth(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 2,
        shadowColor: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        child: Ink(
          child: InkWell(
            child: Container(
              width: CardWidth,
              height: CardHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ticketDetail(),
                  MySeparator(color: Colors.grey),
                  // Divider(),
                  paymentDetail(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //  ticket top part

  Widget ticketDetail() {
    return Container(
      child: Row(
        children: [
          // iCon
          Container(
              padding: const EdgeInsets.all(8),
              color: Colors.white,
              child: const Icon(
                Icons.calendar_view_day_rounded,
                color: Colors.green,
              )),
          Container(
            width: CardWidth * 0.63,
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      Text(
                        "1234567890",
                        style: TextStyle(
                          color: Colors.green[900],
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Makalidurga",
                        style: TextStyle(
                          color: Colors.green[900],
                          fontFamily: Roboto,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      const Icon(
                        Icons.location_on_sharp,
                        color: Colors.green,
                        size: 14,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        "Bengaluru",
                        style: TextStyle(
                          color: Colors.green[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      Text(
                        "13:30, 12 May 2022",
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: Roboto,
                          color: Colors.grey[700]!,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            width: Config().deviceWidth(context) * 0.2,
            child: Container(
              child: Column(
                children: [
                  Text(
                    "3",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.green[900],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Visitors",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.green[900],
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget paymentDetail() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // iCon
          Container(
              padding: const EdgeInsets.all(8.0),
              color: Colors.white,
              child: const Icon(
                Icons.payment_rounded,
                color: Colors.green,
              )),
          Container(
            width: CardWidth * 0.63,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      Text(
                        "Guide Name",
                        style: TextStyle(
                          color: Colors.green[900],
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 0,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    "13:30, 12 May 2022",
                    style: TextStyle(
                      color: Colors.grey[700]!,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                )
              ],
            ),
          ),
          // amount
          Container(
            width: CardWidth * 0.2,
            child: Column(
              children: [
                // Text(
                //   '₹ 500',
                //   style: TextStyle(
                //     fontSize: 20,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.black,
                //   ),
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
  // ticket payment part
  // left icons 20%
  //

}

class MySeparator extends StatelessWidget {
  const MySeparator({Key? key, this.height = 0.6, this.color = Colors.black}) : super(key: key);
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 10.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}

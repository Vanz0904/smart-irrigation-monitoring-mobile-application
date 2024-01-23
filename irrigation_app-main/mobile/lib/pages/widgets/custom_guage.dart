import 'package:flutter/material.dart';
import 'package:kdgaugeview/kdgaugeview.dart';

class CustomGaugeContainer extends StatelessWidget {
  final List<double> alertSpeedArray;
  final List<Color> alertColorArray;
  final String unitOfMeasurement;
  final String iconpath;
  final String amount;
  final String mesurement;
  final double speed;

  const CustomGaugeContainer({
    Key? key,
    required this.alertSpeedArray,
    required this.alertColorArray,
    required this.unitOfMeasurement,
    required this.iconpath,
    required this.amount,
    required this.mesurement,
    required this.speed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Card(
      color: const Color.fromRGBO(53, 53, 55, 1),
      surfaceTintColor: const Color.fromRGBO(53, 53, 55, 1),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        children: [
          Container(
            width: 110,
            height: 110,
            padding: const EdgeInsets.all(10),
            child: KdGaugeView(
                minSpeed: 0,
                maxSpeed: 35,
                minMaxTextStyle:
                    const TextStyle(color: Colors.grey, fontSize: 5),
                speed: speed,
                speedTextStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
                animate: true,
                duration: const Duration(seconds: 5),
                alertSpeedArray: alertSpeedArray,
                alertColorArray: alertColorArray,
                unitOfMeasurement: unitOfMeasurement,
                unitOfMeasurementTextStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
                gaugeWidth: 5,
                fractionDigits: 1,
                innerCirclePadding: 10),
          ),
          Row(
            children: [
              Container(
                height: deviceSize.height * 0.07,
                width: deviceSize.width * 0.1,
                padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(0, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image(
                  image: AssetImage(iconpath),
                  height: 80,
                  width: 80,
                ),
              ),
              Column(
                children: [
                  RichText(
                    text: TextSpan(
                      style:  TextStyle( color: Colors.grey[500]
                      ),
                      children: <TextSpan>[
                        
                        TextSpan(
                            text: mesurement,
                            style:  const TextStyle(
                              fontSize: 15.0, color: Colors.white
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

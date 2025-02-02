import 'package:flutter/material.dart';

class CustomTableWidget extends StatelessWidget {
  const CustomTableWidget(
      {super.key,
      required this.textName,
      required this.textName2,
      required this.textNo,
      required this.textNo2,
      required this.textSub,
      required this.textSub2,
      required this.textexplain,
      required this.textexplain2});
  final String textName;
  final String textName2;
  final String textNo;
  final String textNo2;
  final String textSub;
  final String textSub2;
  final String textexplain;
  final String textexplain2;

  @override
  Widget build(BuildContext context) {
    return Table(
      border: null,
      children: [
        TableRow(
          children: [
            TableCell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  textName,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.redAccent,
                  ),
                ),
              ),
            ),
            TableCell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(textName2, style: TextStyle(fontSize: 25)),
              ),
            ),
          ],
        ),
        TableRow(
          decoration: BoxDecoration(color: Colors.grey.shade400),
          children: [
            TableCell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  textNo,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.redAccent,
                  ),
                ),
              ),
            ),
            TableCell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(textNo2, style: TextStyle(fontSize: 25)),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  textSub,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.redAccent,
                  ),
                ),
              ),
            ),
            TableCell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(textSub2, style: TextStyle(fontSize: 25)),
              ),
            ),
          ],
        ),
        TableRow(
          decoration: BoxDecoration(color: Colors.grey.shade400),
          children: [
            TableCell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  textexplain,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.redAccent,
                  ),
                ),
              ),
            ),
            TableCell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(textexplain2, style: TextStyle(fontSize: 25)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

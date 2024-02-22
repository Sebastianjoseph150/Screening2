import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screening2/constants/const.dart';

class Companyinfowidget extends StatelessWidget {
  const Companyinfowidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Company Info',
          style: GoogleFonts.acme(color: Colors.blue),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            height: 400,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Company :',
                      style: acmeboldstyle,
                    ),
                    Text(
                      'Geeksynergy Technologies',
                      style: acmestyle,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Address :',
                      style: acmeboldstyle,
                    ),
                    Text(
                      'Sanjayanagr, Bengaluru-56',
                      style: acmestyle,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Phone :',
                      style: acmeboldstyle,
                    ),
                    Text(
                      'XXXXXXXXX9',
                      style: acmestyle,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Email :',
                      style: acmeboldstyle,
                    ),
                    Text(
                      'XXXXX@gmail.com',
                      style: acmestyle,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

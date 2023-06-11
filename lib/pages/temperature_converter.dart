import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class TemperatureConverter extends StatefulWidget {
  const TemperatureConverter({super.key});

  @override
  State<TemperatureConverter> createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  TextEditingController tempFahrenheit = TextEditingController();
  TextEditingController tempCelsius = TextEditingController();
  num? tempFahren;
  num? tempCelsi;
  TextEditingValue? tempCelcius2;

  void fahrenheitToCelsius() {
    tempFahren = num.parse(tempFahrenheit.text);
    tempCelsi = ((tempFahren! - 32) * (5 / 9));
    tempCelsius.value = tempCelsius.value.copyWith(
      text: tempCelsi?.toStringAsFixed(2),
      selection: TextSelection.collapsed(offset: tempCelsius.toString().length),
    );
    setState(() {});
  }

  void celsiusToFahrenheit() {
    num tempCels = num.parse(tempCelsius.text);
    num tempFahren = ((tempCels * (9 / 5)) + 32);
    tempFahrenheit.value = tempFahrenheit.value.copyWith(
      text: tempFahren.toStringAsFixed(2),
      selection: TextSelection.collapsed(offset: tempFahren.toString().length),
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            height: 57.h,
            color: const Color(0xff146C94),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.5.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 121.h,
                  ),
                  SizedBox(
                    height: 59.h,
                    child: TextField(
                      controller: tempFahrenheit,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.r),
                              borderSide: const BorderSide(
                                color: Color(0xff146C94),
                                width: 2,
                              )),
                          hintText: "Enter Fahrenheit",
                          hintStyle: GoogleFonts.inter(
                            textStyle: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 20.h),
                          prefixIcon:
                              const Icon(FontAwesomeIcons.temperatureHigh)),
                    ),
                  ),
                  SizedBox(
                    height: 11.h,
                  ),
                  SizedBox(
                    width: 56.w,
                    height: 60.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff146C94),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.r))),
                      onPressed: () {
                        celsiusToFahrenheit();
                      },
                      child: Center(
                        child: Container(
                          width: 25,
                          height: 25,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: const Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.arrowDown,
                                color: Color(0xffffffff),
                                size: 16,
                              ),
                              FaIcon(
                                FontAwesomeIcons.arrowUp,
                                color: Color(0xffffffff),
                                size: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 11.h,
                  ),
                  SizedBox(
                    height: 59.h,
                    child: TextField(
                      controller: tempCelsius,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.r),
                              borderSide: const BorderSide(
                                color: Color(0xff146C94),
                                width: 2,
                              )),
                          hintText: "Enter Celsius",
                          hintStyle: GoogleFonts.inter(
                            textStyle: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 20.h),
                          prefixIcon:
                              const Icon(FontAwesomeIcons.temperatureHigh)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 83.h,
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 16.5.w),
                width: double.infinity,
                height: 56.h,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff146C94),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        )),
                    onPressed: () {
                      setState(() {
                        fahrenheitToCelsius();
                      });
                    },
                    child: Text(
                      "Convert",
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}

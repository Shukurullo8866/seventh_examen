import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class DrawerBaner extends StatefulWidget {
  const DrawerBaner({super.key});

  @override
  State<DrawerBaner> createState() => _DrawerBanerState();
}

class _DrawerBanerState extends State<DrawerBaner> {
  AdaptiveThemeMode? themeMode;
  Future<void> _getMode() async {
    themeMode = await AdaptiveTheme.getThemeMode();
  }

  Future<void> _switchTheme() async {
    if (themeMode!.isDark) {
      AdaptiveTheme.of(context).setLight();
    } else {
      AdaptiveTheme.of(context).setDark();
    }
    await _getMode();
  }

  @override
  void initState() {
    _getMode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black54,
            Colors.white30
          ],
        ),
      ),
      child: DrawerHeader(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child:
                    IconButton(
                      icon: Icon(
                        Theme.of(context).scaffoldBackgroundColor ==
                            Colors.white
                            ? Icons.dark_mode_outlined
                            : Icons.light_mode_outlined,
                        color: Colors.white,
                        size: 30.sp,
                      ),
                      onPressed: () async {
                        await _switchTheme();
                      },
                    )
                      ,),

                    Text(
                      'Theme',
                      style: GoogleFonts.urbanist(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

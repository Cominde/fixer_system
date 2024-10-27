import 'package:fixer_system/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';
import 'package:url_launcher/url_launcher.dart';

class NewUpdateScreen extends StatefulWidget {
  const NewUpdateScreen({super.key});

  @override
  State<NewUpdateScreen> createState() => _NewUpdateScreenState();
}

class _NewUpdateScreenState extends State<NewUpdateScreen> with TickerProviderStateMixin {

  late AnimationController textController;
  late Animation<double> textAnimation;
  late AnimationController buttonController;
  late Animation<double> buttonAnimation;

  @override
  void initState() {
    super.initState();
    textController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    buttonController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    textAnimation = CurvedAnimation(
      parent: textController,
      curve: Curves.fastOutSlowIn,
    );
    buttonAnimation = CurvedAnimation(
        parent: buttonController,
        curve: Curves.bounceIn,
        reverseCurve: Curves.slowMiddle
    );
  }

  @override
  void dispose() {
    textController.dispose();
    buttonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(backgroundColor: FlutterFlowTheme.of(context).primaryBackground,),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: AnimatedBuilder(
              animation: textAnimation,
              builder: (context, child) {
                return Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    boxShadow: [
                      for (int i = 1; i <= 5; i++)
                        BoxShadow(
                          color: const Color(0xFFF68B1E).withOpacity(textAnimation.value / i),
                          spreadRadius: i * 2.0,
                          blurRadius: i * 3.0,
                        ),
                    ],
                  ),
                  child: Text(
                    'New Update',
                    style: TextStyle(
                      fontSize: 40,
                      color: const Color(0xFFF68B1E),
                      fontWeight: FontWeight.bold,
                      shadows: [
                        for (int i = 1; i <= 3; i++)
                          BoxShadow(
                            color: const Color(0xFFF68B1E).withOpacity(textAnimation.value / i),
                            spreadRadius: i * 2.0,
                            blurRadius: i * 3.0,
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                clipBehavior: Clip.antiAlias,
                child: Image(image: AssetImage(Assets.imagesNewUpdate),height: MediaQuery.sizeOf(context).height*0.4,)
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'New Version Available Now',
              style: FlutterFlowTheme.of(context).headlineMedium,
            ),
          ),
          Expanded(
            child: Center(
              child: AnimatedBuilder(
                animation: buttonAnimation,
                builder: (context, child) {
                  return GestureDetector(
                    onTap: () {
                      launchUrl(Uri.parse('https://files.fm/u/wuekxgzks9'));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xFFF68B1E),
                        boxShadow: [
                          for (int i = 1; i <= 5; i++)
                            BoxShadow(
                              color: const Color(0xFFF68B1E).withOpacity(buttonAnimation.value / i),
                              spreadRadius: i * 2.0,
                              blurRadius: i * 3.0,
                            ),
                        ],
                      ),
                      child: Text(
                        'Download New Version',
                        style: FlutterFlowTheme.of(context)
                            .titleMedium
                            .override(
                          fontFamily: 'Lexend Deca',
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
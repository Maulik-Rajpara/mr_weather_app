import 'package:flutter/material.dart';

import '../../constant/api_constant.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Image.asset(ApiConstant.appLogo,isAntiAlias: true,
            height: 200,width: 200,),

          const SizedBox(height: 40,),
          const Text("Weather\nTracker",style: TextStyle(fontSize: 40,
              fontWeight: FontWeight.bold)),

        ],
      ),
    );
  }
}

import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/features/onBoarding/presentation/views/widgets/page_view_item.dart';
import 'package:flutter/material.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: const [
        PageViewItem(
          image: Assets.imagesPageViewItem1Image,
          backgroundImage: Assets.imagesPageViewItem1BackgroundImage,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("مرحبًا بك في "),
              Text("HUB"),
              Text("Fruit"),
            ],
          ),
          subTitle:
              "اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.",
        ),
        PageViewItem(
            image: Assets.imagesPageViewItem2Image,
            backgroundImage: Assets.imagesPageViewItem2BackgroundImage,
            title: Text(
              "ابحث وتسوق",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xff0C0D0D),
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  height: 0),
            ),
            subTitle:
                "نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية"),
      ],
    );
  }
}

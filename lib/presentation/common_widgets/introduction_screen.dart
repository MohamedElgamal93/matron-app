import 'dart:async';
import 'dart:math';

import 'package:environment/presentation/common_widgets/intro_button.dart';
import 'package:environment/presentation/common_widgets/page_view_model.dart';
import 'package:environment/util/constants/colors.dart';
import 'package:environment/util/constants/images.dart';
import 'package:environment/util/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//import './../../app_constants.dart';

class IntroductionScreen extends StatefulWidget {
  final List<PageViewModel> pages;

  final VoidCallback onDone;

  final Widget done;

  final VoidCallback? onSkip;

  final ValueChanged<int>? onChange;

  final Widget skip;

  final Widget next;

  /// @Default `false`
  final bool showSkipButton;

  /// @Default `true`
  final bool? showNextButton;

  /// @Default `true`
  final bool isProgress;

  /// @Default `false`
  final bool freeze;

  final Color globalBackgroundColor;

  /// @Default `350`
  final int animationDuration;

  /// @Default `0`
  final int initialPage;

  /// @Default `1`
  final int skipFlex;

  /// @Default `1`
  final int dotsFlex;

  /// @Default `1`
  final int nextFlex;

  /// @Default `Curves.easeIn`
  final Curve curve;

  const IntroductionScreen({
    Key? key,
    required this.pages,
    required this.onDone,
    required this.done,
    required this.onSkip,
    this.onChange,
    required this.skip,
    required this.next,
    this.showSkipButton = false,
    this.showNextButton = true,
    this.isProgress = true,
    this.freeze = false,
    required this.globalBackgroundColor,
    this.animationDuration = 500,
    this.initialPage = 0,
    this.skipFlex = 1,
    this.dotsFlex = 1,
    this.nextFlex = 1,
    this.curve = Curves.easeIn,
  })  : assert(
          pages.length > 0,
          "You provide at least one page on introduction screen !",
        ),
        assert((showSkipButton) || !showSkipButton),
        assert(skipFlex >= 0 && dotsFlex >= 0 && nextFlex >= 0),
        assert(initialPage >= 0),
        super(key: key);

  @override
  IntroductionScreenState createState() => IntroductionScreenState();
}

class IntroductionScreenState extends State<IntroductionScreen> {
  late PageController _pageController;
  double _currentPage = 0.0;
  bool _isSkipPressed = false;
  bool _isScrolling = false;

  PageController get controller => _pageController;

  @override
  void initState() {
    super.initState();
    int initialPage = min(widget.initialPage, widget.pages.length - 1);
    _currentPage = initialPage.toDouble();
    _pageController = PageController(initialPage: initialPage);
  }

  void _onNext() {
    animateScroll(min(_currentPage.round() + 1, widget.pages.length - 1));
  }

  Future<void> _onSkip() async {
    if (widget.onSkip != null) return widget.onSkip!();
    await skipToEnd();
  }

  Future<void> skipToEnd() async {
    setState(() => _isSkipPressed = true);
    await animateScroll(widget.pages.length - 1);
    setState(() => _isSkipPressed = false);
  }

  Future<void> animateScroll(int page) async {
    setState(() => _isScrolling = true);
    await _pageController.animateToPage(
      page,
      duration: Duration(milliseconds: widget.animationDuration),
      curve: widget.curve,
    );
    setState(() => _isScrolling = false);
  }

  bool _onScroll(ScrollNotification notification) {
    final metrics = notification.metrics;
    if (metrics is PageMetrics) {
      setState(() => _currentPage = metrics.page!);
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final isLastPage = (_currentPage.round() == widget.pages.length - 1);
    bool isSkipBtn = (!_isSkipPressed && !isLastPage && widget.showSkipButton);

    final skipBtn = IntroButton(
      child: widget.skip,
      onPressed: _onSkip,
    );

    final nextBtn = IntroButton(
      child: widget.next,
      onPressed: _onNext,
    );

    final doneBtn = IntroButton(
      child: widget.done,
      onPressed: widget.onDone,
    );

    return Scaffold(
      backgroundColor: ConstColors.onboardingBackColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: SizeConfig.height(context: context, pixels: 18),
            left: SizeConfig.width(context: context, pixels: 24),
            right: SizeConfig.width(context: context, pixels: 24),
            bottom: SizeConfig.height(context: context, pixels: 24),
          ),
          child: Column(
            children: [
              SvgPicture.asset(
                logoSVG,
                height: SizeConfig.height(context: context, pixels: 30),
                width: SizeConfig.height(context: context, pixels: 35),
                fit: BoxFit.contain,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .65,
                // color: Colors.orange,
                child: NotificationListener<ScrollNotification>(
                  onNotification: _onScroll,
                  child: Stack(
                    children: [
                      PageView(
                        controller: _pageController,
                        physics: widget.freeze
                            ? const NeverScrollableScrollPhysics()
                            : const BouncingScrollPhysics(),
                        children: widget.pages
                            .map(
                              (p) => FittedBox(
                                  fit: BoxFit.fitHeight, child: p.bodyWidget),
                            )
                            .toList(),
                        onPageChanged: widget.onChange,
                      ),
                      Positioned(
                        top: (MediaQuery.of(context).size.height * .45),
                        left: 0,
                        right: 0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: widget.dotsFlex,
                              child: Center(
                                child: widget.isProgress
                                    ? SmoothPageIndicator(
                                        controller: controller,
                                        count: widget.pages.length,
                                        effect: const ScrollingDotsEffect(
                                          dotHeight: 8,
                                          dotWidth: 8,
                                          activeDotColor:
                                              ConstColors.textLinkColor,
                                          dotColor:
                                              ConstColors.textQuointaryColor,
                                          activeStrokeWidth: 1,
                                          activeDotScale: 1,
                                          radius: 10,
                                          spacing: 8,
                                        ))
                                    : const SizedBox(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              Visibility(
                  visible: isLastPage ? false : true,
                  child: isSkipBtn
                      ? skipBtn
                      : Opacity(opacity: 0.0, child: skipBtn)),
              isLastPage
                  ? doneBtn
                  : widget.showNextButton!
                      ? nextBtn
                      : Opacity(opacity: 0.0, child: nextBtn),
            ],
          ),
        ),
      ),
    );
  }
}

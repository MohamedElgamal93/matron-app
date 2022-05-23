import 'package:environment/bussniess_logic/slider_bloc/slider_cubit.dart';
import 'package:environment/bussniess_logic/slider_bloc/slider_state.dart';
import 'package:environment/data/model/slider/slider_model.dart';
import 'package:environment/util/applocalizations.dart';
import 'package:environment/util/constants/colors.dart';
import 'package:environment/util/constants/images.dart';
import 'package:environment/util/constants/sizes.dart';
import 'package:environment/util/constants/string_translate.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DefaultSlider extends StatelessWidget {
  final List<SliderModel> sliders;
  final VoidCallback onFinish;
  final CarouselController controller = CarouselController();
  AppLocalizations? localizations;
  DefaultSlider({
    Key? key,
    required this.sliders,
    required this.onFinish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    localizations = AppLocalizations.of(context);
    double imgHeight = SizeConfig.height(
      context: context,
      pixels: 162,
    );
    double indicatorWidgetHeight = SizeConfig.height(
      context: context,
      pixels: 20,
    );
    return BlocProvider(
      create: (_) => SliderCubit(InitialSliderState()),
      child: BlocBuilder<SliderCubit, SliderState>(
        builder: (context, _) {
          return Scaffold(
            backgroundColor: ConstColors.backgroudColors,
            body:
            Column(children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  
                  
                    _getButtons(context),],),
              
                Expanded(child:  Padding(
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.height(context: context, pixels: 18),
                
              ),
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.symmetric( horizontal: SizeConfig.width(context: context, pixels: 35))
                  ,child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                         
                     children: [
                     Padding(padding: EdgeInsets.only(top:15),child:
                        Image.asset(
                    ballImage,
                    height: SizeConfig.height(context: context, pixels: 30),
                    width: SizeConfig.width(context: context, pixels: 30)),
                    
                  ),
                  Spacer(),
                      Image.asset(
                    ballImage,
                    height: SizeConfig.height(context: context, pixels: 30),
                    width: SizeConfig.width(context: context, pixels: 30),
                    
                  )
                     ],
                   )),
                    
                 
                Expanded(child:
                Container(

                  decoration:BoxDecoration(image:DecorationImage(
          image: AssetImage("assets/images/matron_assets/onboarding_wave.png"),
          fit: BoxFit.fill,
        ),) ,
                child:
                
                    Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: SizeConfig.height(
                              context: context,
                              pixels: 15,
                            ),
                          ),
                          child: CarouselSlider(
                            carouselController: controller,
                            items: sliders
                                .map(
                                  (sliderSnapShot) => _sliderItemWidget(
                                    context,
                                    slider: sliderSnapShot,
                                    imgHeight: imgHeight,
                                  ),
                                )
                                .toList(),
                            options: _getCarousalOptions(context),
                          ),
                        ),
                        Positioned(
                          top: imgHeight + indicatorWidgetHeight,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: getCarousalIndicator(context),
                          ),
                        ),
                      ],
                    
                  ))),
               
                ],
              ),
            ))
            ],)
            ,
          );
        },
      ),
    );
  }

  Widget _sliderItemWidget(
    BuildContext context, {
    required SliderModel slider,
    required double imgHeight,
  }) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // SizedBox(height: 50),
        SizedBox(
          height: imgHeight,
          width: SizeConfig.width(context: context, pixels: 203),
          child: FittedBox(
            child: (slider.networkImage ?? '').trim().isNotEmpty
                ? Image.network(slider.networkImage!)
                : Image.asset(
                    slider.imgAssetPath ?? environmentIcon,
                  ),
          ),
        ),
        const SizedBox(height: 25),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                (slider.title ?? ''),
                // maxLines: 2,
                overflow: TextOverflow.fade,
                textAlign: TextAlign.center,
                style: textTheme.headline5?.copyWith(fontSize: 24),
              ),
              Flexible(
                child: Center(
                  child: Text(
                    (slider.subTitle ?? ''),
                    textAlign: TextAlign.center,
                    style: textTheme.bodyText2?.copyWith(color: ConstColors.textSecondaryColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  CarouselOptions _getCarousalOptions(BuildContext context) {
    return CarouselOptions(
      height: MediaQuery.of(context).size.height -
          SizeConfig.height(context: context, pixels: 180),
      viewportFraction: 1,
      enableInfiniteScroll: false,
      onPageChanged: (newPageIndex, _) {
        BlocProvider.of<SliderCubit>(
          context,
          listen: false,
        ).updateIndex(newPageIndex);
      },
    );
  }

  List<Widget> getCarousalIndicator(BuildContext context) {
    final int index = BlocProvider.of<SliderCubit>(
      context,
      listen: false,
    ).index;
    return sliders
        .map(
          (sliderSnapShot) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 3),
            child: Icon(
              Icons.circle,
              color: sliderSnapShot == sliders[index]
                  ? Theme.of(context).primaryColor
                  : Colors.grey.shade400,
              size: SizeConfig.height(context: context, pixels: 13),
            ),
          ),
        )
        .toList();
  }

  Widget _getButtons(BuildContext context) {
    return Container(
      height: SizeConfig.height(context: context, pixels: 150),
      alignment: Alignment.bottomCenter,
      child: 
      
      // BlocProvider.of<SliderCubit>(context, listen: false).index <
      //         sliders.length - 1
      //     ?
          Column(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: onFinish,
                    style: ButtonStyle(
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      foregroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                      elevation: MaterialStateProperty.all(0),
                    ),
                    child: Text(
                      localizations!.translate(skip),
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
                // ButtonCommonWidget(
                //   buttonSize: ButtonSize.fullWidth,
                //   voidCallback: () => controller.nextPage(),
                //   textData: localizations!.translate(continueText),
                // ),
              ],
            )
          // : ButtonCommonWidget(
          //     buttonSize: ButtonSize.fullWidth,
          //     voidCallback: onFinish,
          //     textData: localizations!.translate(getStarted),
          //   ),
    );
  }
}

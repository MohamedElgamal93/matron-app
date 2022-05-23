import 'package:environment/data/repositorys/reositories.dart';
import 'package:environment/data/repositorys/requests.dart';
import 'package:environment/presentation/screens/common_screen/no_internet/no_internet.dart';
import 'package:environment/util/applocalizations.dart';
import 'package:environment/util/constants/colors.dart';
import 'package:environment/util/constants/sizes.dart';
import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../bussniess_logic/text_filed_common/text_input_filed_common_cubit.dart';
import '../../../../util/constants/images.dart';
import '../../../common_widgets/dropdown_search.dart';
import '../../../common_widgets/list_tile_widget.dart';
import '../../../common_widgets/text_input_widgets/text_input_field.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  Repositories repositories = Repositories(RequestsRepository());
  final scrollController = ScrollController();

  late AppLocalizations localizations;

  PageController controller = PageController(initialPage: 0);
  int currentPageIndex = 0;
  int allTransactionsPageNumber = 0;
  int incomeTransactionsPageNumber = 1;
  int outcomeTransactionsPageNumber = 2;
  TabController? tabController;
  var dateController = TextEditingController();
    var todateController = TextEditingController();


  var list = ["الموافقة", "الرفض", "المراجعة"];

  bool calledASFirstTime = true;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController!.addListener(() {
      setState(() {
        print("index${tabController!.index}");
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    tabController!.dispose();
    dateController.dispose();
    todateController.dispose();

    super.dispose();
  }

  @override
  void didChangeDependencies() {
    localizations = AppLocalizations.of(context)!;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: ConstColors.secondaryColor));
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
          statusBarColor: ConstColors.secondaryColor),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Directionality(
                    textDirection: TextDirection.ltr,
                    child: Row(
                      children: [
                        Image.asset(
                          logoHeader,
                          width:
                              SizeConfig.width(context: context, pixels: 119),
                          height:
                              SizeConfig.height(context: context, pixels: 73),
                        ),
                        const Spacer(),
                        Image.asset(setting),
                        Image.asset(operator)
                      ],
                    )),
              ],
            ),
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(
                    SizeConfig.height(context: context, pixels: 150)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                          style: Theme.of(context).textTheme.overline!.copyWith(
                              fontSize: 15,
                              color: ConstColors.primaryColorEviron),
                          text: "مرحبا ",
                          children: [
                            TextSpan(
                                text: "اسم المستخدم",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                        fontSize: 15,
                                        color: ConstColors.primaryColorEviron)),
                            TextSpan(
                                text: "\nطلبيات العمل الخاصة بك",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                        fontSize: 11,
                                        color:
                                            ConstColors.secondaryColorEviron))
                          ]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          color: ConstColors.primaryColorEviron,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      width: MediaQuery.of(context).size.width - 60,
                      child: TabBar(
                        tabs: const [
                          Tab(
                            icon: Icon(Icons.view_agenda),
                            text: "التقارير",
                          ),
                          Tab(
                            icon: Icon(Icons.people_outlined),
                            text: "طلبيات العمل",
                          )
                        ],
                        controller: tabController,
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.white.withOpacity(0.66),
                        indicatorColor: Colors.transparent,
                      ),
                    )
                  ],
                ))),
        body: ConnectivityBuilder(
          builder: (BuildContext context, bool? isConnected,
              ConnectivityStatus? status) {
            if (isConnected == false) {
              return const NoInternetConnection();
            } else {
              return SafeArea(
                child: TabBarView(
                  children: [
                    Container(
                        height: 200,
                        width: 50,
                        padding: const EdgeInsets.only(top: 20),
                        child: ListView.builder(
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(children: [
                              if (index == 0)
                              SizedBox(
                                height: 180,
                              child:
                                Row(
                               mainAxisAlignment:MainAxisAlignment.center,
                                  crossAxisAlignment:CrossAxisAlignment.center ,
                                  children: [
                                    Expanded(child:
                                    SizedBox(
                                       // width: 180,
                                        child: DropDownSearch(
                                          showUnbderLine:true,
                                            hint: "حالة طلبية العمل",
                                            items: list,
                                       ))),

                                            const SizedBox(width: 20,),
                                 
                                 
                                 Column(
                                   children: [
                                     Row(
                                       children: [
                                          Text(
                                      "من تاريخ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                              color: ConstColors
                                                  .primaryColorEviron),
                                    ),
                                       SizedBox(
                                            width: 140,
                                            child:
  BlocProvider(
                                            create: (BuildContext context) =>
                                                UpdatedTextInputCubit(
                                                    Repositories(
                                                        RequestsRepository())),
                                            child: TextInputField(
                                              enabled: true,
                                              //labelText:"",
                                              typeForm: TypeForm.dateOfBusiness,
                                              controller: dateController,
                                            ))
                                            )
                                       ],
                                     ), Row(
                                       children: [
                                          Text(
                                      "الي تاريخ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                              color: ConstColors
                                                  .primaryColorEviron),
                                    ),
                                       SizedBox(
                                            width: 140,
                                            child:
  BlocProvider(
                                            create: (BuildContext context) =>
                                                UpdatedTextInputCubit(
                                                    Repositories(
                                                        RequestsRepository())),
                                            child: TextInputField(
                                              enabled: true,
                                              //labelText:"",
                                              typeForm: TypeForm.dateOfBusiness,
                                              controller: todateController,
                                            ))
                                            )
                                       ],
                                     )

                                   ],
                                 )
                                   
                                  
                                  ],
                                )),
                              ListTileWidget(
                                  focusColor: ConstColors.focusColors,
                                  title: "12",
                                  garbshRemove: true,
                                  onTab: () => print(""))
                            ]);
                          },
                        )),
                    Container(
                        height: 200,
                        width: 50,
                        padding: const EdgeInsets.only(top: 20),
                        child: ListView.builder(
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTileWidget(
                                focusColor: ConstColors.focusColors,
                                title: "12",
                                garbshRemove: true,
                                onTab: () => print(""));
                          },
                        )),
                  ],
                  controller: tabController,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

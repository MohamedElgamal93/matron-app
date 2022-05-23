/// Common Strings**/
//Server https://api.environment.co/v1/
//Stage  https://api-staging.environment.co/v1
//dev1  https://api-dev1.environment.co
const baseUrl = 'http://3.219.94.115/api/v1/';
// const baseUrlPayment = 'https://ap-gateway.mastercard.com/';
// const redirectResponseUrl = 'https://api-staging.environment.co/wallet/redirection_page/index.php';
// const merchantId = '3000001305';
// const apiVersion = '61';

const String downloadCertificateUrl =
    "${baseUrl}projects/$idPlaceholder/stock-certificate";
const String idPlaceholder = 'PROJECT-ID';

const String downloadInvestmentReceipt =
    baseUrl + 'invest_operations/pdfDownload/';
// const baseUrlPayment = 'https://test-gateway.mastercard.com/';

// const redirectResponseUrl =
//     'https://api-staging.environment.co/wallet/redirection_page/index.php';
// const merchantId = '3000001305';
// const apiVersion = '61';
String aboutUsUrl = 'https://environment.fund/';

const String notificationsIcon = '@drawable/launch_img';
const String notificationsChannelId = 'high_importance_channel';
const String notificationsChannelTitle = 'High Importance Notifications';
const String notificationsChannelDescription =
    'All environment notifications are sent via this channel';
//----------------------------------------
const String fontFamilyExtraBold = "Almarai-ExtraBold";
const String fontFamilyBold = "Almarai-Bold";
const String fontFamilyLight = "Almarai-Light";
const String fontFamilyRegular = "Almarai-Regular";

/// Route Strings**/
const String pinScreen = "/pinScreen";
const String bankAccountScreen = "/bankAccountScreen";
const String userSavedBanksScreen = "/userSavedBanksScreen";
const String userSavedCardsScreen = "/userSavedCardsScreen";
const String firstScreen = "/";
const String pinChangeSuccess = "/pinSuccessWidget";
const String homePage = "/HomePage";
const String tokenExpireScreen = "/tokenExpireScreen";
const String loginScreen = "/LoginScreen";
const String passwordValidation = "/passwordValidation";
const String registerFirst = "/registerFirst";
const String loginRoute = "/login_page";


const String termAndCondition = "/termAndCondition";
const String legalAgreementScreen = "/legalAgreementScreen";
const String onBoardPage = "/Onboardingpage";
const String mappingScreenPoly = "/mappin_poly_line";
const String performancePage = "/mapping_page";


const String paymentConfirmationScreen = "/paymentConfirmationScreen";
const String notification_permession = "/notification_permession";
const String paymentPage = "/payment_method";
const String settingPage = "/settingscreen";
const String verificationPage = "/Verification";
const String profileDetailsPage = "/profile_details";
const String questionnarePage = "/questionnare_page";
const String KYCSummaryPage = "/kyc_summary_page";
const String investorTypePage = "/investor_type";
const String finishRegistrationPage = "/passwordValidationPage";
const String secRegister = "/secRegister";
const String investingSuccess = "/investingSuccess";
const String filterScreen = "/filter_page";
const String faqScreen = "/faqScreen";
const String professionalInvestorPage = "/professional_investor";
const String institutionalInvestorPage = "/institutional_investor";
const String emptyConnectivity = "/empty_screen_connection";
const String performanceDetailsPage = "/performance_details";
const String investProject = "/investProject";
const String investmentReceipt = "/investmentReceipt";
const String supportPage = "/support_page";
const String setPhoneForget = "/setPhoneForget";
const String notificationPage = "/notificationPage";
const String applePayPage = "/apple_pay";
const String withdrawScreen = "/withdrawScreen";
const String debitCreditRoute = "/debit_credit_card";
const String addNewDebit = "/addNewDebit";
const String payWithToken = "/payWithToken";
const String newBankAccount = "/newBankAccount";
const String privacyPolicy = "/privacyPolicy";
const String radioButtonsPage = "/radio_button";
const String setNewPasswordPage = "/setNewPassword";
const String withdrawConfirmScreen = "/withdrawConfirmScreen";
const String currentPasswordsPage = "/current_password";
const String dashboardAsVisitor = "/dashboard_as_visitor";
const String dashboardRoute = "/dashboard";
const String investmentLoading = "/investmentLoading";
const String investmentTransactionsScreen = "/investmentTransactionsScreen";
const String investmentReportsScreen = "/investmentReportsScreen";

const String changeLanguagePage = "/change_language";
const String underReviewScreen = "/under_review_page";

/// constant  Strings **/

const String individualInvestorButton = "individualInvestor";
const String profassionalInvestorButton = "profassionalInvestor";
const String institutionalInvestorButton = "institutionalInvestor";
const String englishLanguage = "englishLanguageTrue";
const String arabicLanguage = "arabicLanguageTrue";
const String english = "English";
const String arabic = "Arabic";
const String codeCountryNumber = "+966";
const String phoneCountryCode = "SAR";
const String questionsSelected = "select";
const String transactionStatusPaid = "paid";
const String transactionDirectionInWallet = "in";
const String initialCountryCode = "SA";
const int maxLin = 10;
const double minNumberFilter = 0;
const double minNumberPerShareFilter = 0;

//Date Picker

const String formatDatePicker = 'yyyy-MM-dd';

const int firstDatePicker = 1900;
const int lastDatePicker = 2010;

const arabicLanguageCode = 'ar';
const englishLanguageCode = 'en';

// Shared preference Key
const String languageKey = 'language';
const String userDataKey = 'userData';
const String isFirstRunKey = "isFirstRun";
//wallet Transactions Keys
const String allTransactionsKey = "all";
const String incomeTransactionsKey = "income";
const String outcomeTransactionsKey = "outcome";
//languages
const String arabicLanguagekey = "العربية";
const String englishLanguagekey = "English";

//change language
const String arabicClose = "اغلاق";
const String englishClose = "Close";
const String enlanguageskey = "Language";
const String arlanguageskey = "اللغة";

const String arabicTranslatekey = "Arabic";
const String englishTranslatekey = "الانجليزية";

//walletAmount
const String walletAmountIsEmpty = "0.00";

//project status keys
const String fundingStatus = "funding";
const String completedStatus = "finished";
const String soonStatus = "published";
const String settledStatus = "settled";
const String inCompleteStatus = "closed";

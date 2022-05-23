//--------------------------------------------------//
//-------------------End points---------------------//
//--------------------------------------------------//

abstract class Endpoint {
  static const String verifyPhoneEmail = "register/verifyPhoneEmail";
  static const String projects = "projects";
  static const String fetchAllQuestions = "questionnaire/getQuestions";
  static const String fetchAllInstitutionalInvestor =
      "organizations/getInvestorCompany";
  static const String accountSettings = "account_settings";
  static const String investorsType = "roles/getInvestorRoles";
  static const String profileData = "profile/getProfileData";
  static const String rangeFilters = "projects/filter";
  static const String bankTransfer = "fund_operations/bank_transfer";
  static const String allDocumentData =
      'files/getProfessionalInvestorFileTypes';
  static const String walletTransactions = "wallet/transactions";
  static const String getFiles = "files/getFiles";
  static const String requestSupport = "system_defaults/contact_us";
  static const String updateQuestionsData = "questionnaire/sendAnswers";
  static const String finalUploadFileData =
      "account_settings/updateProfessionalData";
  static const String deleteDocument = "deleteDoc";
  static const String getAllCities = "system_defaults/cities";
  static const String supportTypes = "system_defaults/contact_us/type_list";
  static const String statistics = "statistics";
  static const String projectInvested = "projects/invested";
  static const String login = "auth/login";
  static const String location = "transportation/buses/track?id=1";

  static const String logout = "logout";
  static const String revokeFCMToken = "revokeFCMToken";
  static const String changeTwoFactorAuthPostRequest =
      "account_settings/change_2FA_status";
  static const String updateProfileData = "profile/updateProfileData";
  static const String uploadFileData = "files/saveFiles";
  static const String updatePassword = "profile/updateProfilePassword";
  static const String institutionalInvestor =
      "/organizations/updateCompanyData";
  static const String checkPhone = "forgetPassword/checkPhone";
  static const String errorToSlack = "errorToSlack";
  static const String resetPassword = "forgetPassword/resetPassword";
  static const String withdrawWallet = "withdraw_operations/withdraw";
  static const String verifyID = "/register/verifyID";
  static const String finishRegistration = "/register/finishRegistration";
  static const String countNotification = "notifications/count";
  static const String notifications = "notifications";
  static const String cards = "fund_operations/cards";
  static const String myBankAccounts = "withdraw_operations/bank_accounts";
  static const String allBanks = "withdraw_operations/banks";
  static const String addBank = "withdraw_operations/bank_accounts";
  static const String privacy = "system_defaults/privacy";
  static const String faq = "system_defaults/faq";
  static const String onBoarding = "system_defaults/onboard";
  static const String legalAgreement = "system_defaults/legal_agreement";
  static const String addFund = 'fund_operations/add_fund';
  static const String confirmAddFund = "fund_operations/confirm_add_fund";
  static const String walletBalance = "wallet/balance";
  static const String settings = "system_defaults/settings";
  static const String registerFirst = "/registerFirst";
  static const String productEndPoint = "products";


  static const String termsAndConditions =
      "system_defaults/terms_and_conditions";

  static String requestInvest(int projectId) =>
      "invest_operations/$projectId/invest";

  static String projectPerformanceDetails(int projectId) =>
      "project_investments/$projectId/statistics";

  static String projectPerformanceInvestments(int projectId) =>
      "project_investments/$projectId";

  static String fetchReports(int projectId) => "projects/$projectId/reports";

  static String fetchDocuments(int projectId) =>
      "projects/$projectId/documents";

  static String fetchGalleries(int projectId) =>
      "projects/$projectId/galleries";

  static String deleteCard(int cardId) => "fund_operations/cards/$cardId";

  static String deleteBank(dynamic bankId) =>
      "withdraw_operations/bank_accounts/$bankId";

  static String withdrawProject(int projectId) =>
      "invest_operations/$projectId/withdraw";
}

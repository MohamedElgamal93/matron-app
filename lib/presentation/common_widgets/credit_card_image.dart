import 'package:environment/util/constants/images.dart';
import 'package:flutter/material.dart';

///  ///  ///  
/// American Express
///    American Express Corporate
///   Australian BankCard
///    Diners Club
///     Discover
///     JCB
///     MasterCard
///     Visa
///     Dankort (PBS)
///      Switch/Solo (Paymentech).
///  ///  ///


class CreditCardImage extends StatelessWidget {
  final String brand;
  const CreditCardImage(this.brand,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    switch(brand){
    case "visa":
      return Image.asset(visa);
     case "jcb":
      return Image.asset(jcb);
     case "mastercard":
      return Image.asset(mastercard);
     case "dankort_pbs":
      return Image.asset(dankort);
     case "diners_club":
      return Image.asset(dinersClub);
     case "american_express":
      return Image.asset(americanExpress);
     case "american_express_corporate":
      return Image.asset(americanExpress);
     case "discover":
      return Image.asset(discover);
     case "switch_Solo_paymentech":
      return Image.asset(switchSolo);
     default:
      return Image.asset(visa);
    }
  }
}

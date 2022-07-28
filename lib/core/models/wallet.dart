class Wallet {
  String? mainBalance;
  String? savingsBalance;
  String? investmentBalance;
  List? transactions;

  Wallet(
      {this.mainBalance,
      this.savingsBalance,
      this.investmentBalance,
      this.transactions});

  Wallet.fromJson(Map<String, dynamic> json) {
    mainBalance = json['main_balance'] == null ? null : json['main_balance'].toString();
    savingsBalance = json['savings_balance'] == null ? null : json['savings_balance'].toString();
    investmentBalance = json['investment_balance'] == null ? null : json['investment_balance'].toString();
    if (json['transactions'] != null) {
      transactions = new List.empty(growable: true);
      json['transactions'].forEach((v) {
        transactions!.add(v);
      });
    }
  }
}

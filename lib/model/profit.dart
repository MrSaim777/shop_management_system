// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Profit {
  int expenses;
  int income;
  int profit;
  int netProfit;
  DateTime date;
  Profit({
    required this.expenses,
    required this.income,
    required this.profit,
    required this.netProfit,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'expenses': expenses,
      'income': income,
      'profit': profit,
      'netProfit': netProfit,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory Profit.fromMap(Map<String, dynamic> map) {
    return Profit(
      expenses: map['expenses'] as int,
      income: map['income'] as int,
      profit: map['profit'] as int,
      netProfit: map['netProfit'] as int,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Profit.fromJson(String source) =>
      Profit.fromMap(json.decode(source) as Map<String, dynamic>);
}

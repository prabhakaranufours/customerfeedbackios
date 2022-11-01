class Scorecalculation {
  Scorecalculation({
      this.score, 
      this.weightage,});

  Scorecalculation.fromJson(dynamic json) {
    score = json['score'];
    weightage = json['Weightage'];
  }
  String? score;
  String? weightage;
Scorecalculation copyWith({  String? score,
  String? weightage,
}) => Scorecalculation(  score: score ?? this.score,
  weightage: weightage ?? this.weightage,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['score'] = score;
    map['Weightage'] = weightage;
    return map;
  }

}
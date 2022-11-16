class ScoreCalculation{

  //Constructor
  ScoreCalculation();

  //This method calculate the score and put in progress bar
   getScoreCalculate(List<Map> scoreCalculation) async {
    int? int_score = 0;
    int? int_weight = 0;
    int? scoreWeight = 0;
    int totalWeightage = 0;

    for (int i = 0; i < scoreCalculation.length; i++) {
      var score = scoreCalculation[i]["scoreid"];
      var weight = scoreCalculation[i]["weightage"];
      var temp_score = int.parse(score);
      int_score = int_score! + temp_score;
      var temp_weight = int.parse(weight);
      int_weight = int_weight! + temp_weight;
      scoreWeight = temp_score * temp_weight;
      totalWeightage = totalWeightage + scoreWeight!;
    }

    //Total value
    var final_totalScore = totalWeightage / int_weight!;
    final_totalScore = final_totalScore * 100;

    var decimal_final_score = final_totalScore;
    decimal_final_score = final_totalScore / 3;

  }

}
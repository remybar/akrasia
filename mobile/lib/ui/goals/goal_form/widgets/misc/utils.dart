// Package imports:
import 'package:kt_dart/kt.dart';

// Project imports:
import 'package:akrasia/domain/goals/value_objects/goal_period.dart';
import 'package:akrasia/domain/goals/value_objects/goal_pledge.dart';
import 'package:akrasia/domain/goals/value_objects/goal_type.dart';

String durationToString(int nbSeconds) {
  final int hours = nbSeconds ~/ 3600;
  final int minutes = (nbSeconds - (hours * 3600)) ~/ 60;
  final int seconds = nbSeconds - (hours * 3600) - (minutes * 60);
  String result = "";
  result += hours > 0 ? "${hours}h" : "";
  result += minutes > 0 ? "${minutes}min" : "";
  result += seconds > 0 ? "${seconds}sec" : "";

  return result;
}

String typeToString(GoalType type, {bool toReach = true}) {
  final String prefix = toReach ? "min." : "max.";
  return type.when(
    yesNoGoal: () => "Oui/Non",
    countGoal: (data) => data.countValue.isValid() ? "$prefix ${data.countValue.getOrCrash()} fois" : "",
    timerGoal: (data) => data.timeValue.isValid() ? "$prefix ${durationToString(data.timeValue.getOrCrash())}" : "",
    valueGoal: (data) => (data.value.isValid() && data.unit.isValid())
        ? "$prefix ${data.value.getOrCrash()} ${data.unit.getOrCrash()}"
        : "",
  );
}

String pledgeToString(GoalPledge pledge) {
  return pledge.when(
    noPledge: () => "aucun",
    pledge: (data) => "départ: ${data.start.getOrCrash()}€ max: ${data.max.getOrCrash()}€",
  );
}

String periodToString(GoalPeriod period) {
  const days = ["Dim", "Lun", "Mar", "Mer", "Jeu", "Ven", "Sam"];
  return period.when(
    every: (data) {
      final prefix = data.kind == GoalPeriodKind.week ? "Toutes les" : "Tous les";
      return data.count.getOrCrash() > 1
          ? "$prefix ${data.count.getOrCrash()} ${kindToString(data.kind, toPlural: true)}"
          : "$prefix ${kindToString(data.kind, toPlural: true)}";
    },
    onDay: (data) {
      final selectedDays = data.weekdays
          .mapIndexed(
            (index, value) => value ? days[index % 7] : null,
          )
          .filter((value) => value != null);
      return selectedDays.joinToString(separator: ", ");
    },
  );
}

String kindToString(GoalPeriodKind kind, {bool toPlural = false}) {
  switch (kind) {
    case GoalPeriodKind.day:
      return toPlural ? "jours" : "jour";
    case GoalPeriodKind.week:
      return toPlural ? "semaines" : "semaine";
  }
  return "";
}

import 'package:kt_dart/kt.dart';
import 'package:akrasia/domain/goals/goal_period.dart';

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
    case GoalPeriodKind.month:
      return "mois";
  }
  return "";
}

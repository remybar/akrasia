// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: return_of_invalid_type, constant_identifier_names, prefer_const_constructors_in_immutables, unnecessary_this, sort_unnamed_constructors_first, join_return_with_assignment, missing_return, lines_longer_than_80_chars

part of 'goal_type.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class GoalType extends Equatable {
  const GoalType(this._type);

  factory GoalType.yesNoGoal() = YesNoGoal.create;

  factory GoalType.countGoal({@required GoalCountValue countValue}) =
      CountGoal.create;

  factory GoalType.timerGoal({@required GoalTimeValue timeValue}) =
      TimerGoal.create;

  factory GoalType.valueGoal(
      {@required GoalValue value, @required GoalUnit unit}) = ValueGoal.create;

  final _GoalType _type;

  /// The [when] method is the equivalent to pattern matching.
  /// Its prototype depends on the _GoalType [_type]s defined.
  R when<R extends Object>(
      {@required R Function() yesNoGoal,
      @required R Function(CountGoal) countGoal,
      @required R Function(TimerGoal) timerGoal,
      @required R Function(ValueGoal) valueGoal}) {
    assert(() {
      if (yesNoGoal == null ||
          countGoal == null ||
          timerGoal == null ||
          valueGoal == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _GoalType.YesNoGoal:
        return yesNoGoal();
      case _GoalType.CountGoal:
        return countGoal(this as CountGoal);
      case _GoalType.TimerGoal:
        return timerGoal(this as TimerGoal);
      case _GoalType.ValueGoal:
        return valueGoal(this as ValueGoal);
    }
  }

  /// The [whenOrElse] method is equivalent to [when], but doesn't require
  /// all callbacks to be specified.
  ///
  /// On the other hand, it adds an extra orElse required parameter,
  /// for fallback behavior.
  R whenOrElse<R extends Object>(
      {R Function() yesNoGoal,
      R Function(CountGoal) countGoal,
      R Function(TimerGoal) timerGoal,
      R Function(ValueGoal) valueGoal,
      @required R Function(GoalType) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _GoalType.YesNoGoal:
        if (yesNoGoal == null) break;
        return yesNoGoal();
      case _GoalType.CountGoal:
        if (countGoal == null) break;
        return countGoal(this as CountGoal);
      case _GoalType.TimerGoal:
        if (timerGoal == null) break;
        return timerGoal(this as TimerGoal);
      case _GoalType.ValueGoal:
        if (valueGoal == null) break;
        return valueGoal(this as ValueGoal);
    }
    return orElse(this);
  }

  /// The [whenPartial] method is equivalent to [whenOrElse],
  /// but non-exhaustive.
  void whenPartial(
      {void Function() yesNoGoal,
      void Function(CountGoal) countGoal,
      void Function(TimerGoal) timerGoal,
      void Function(ValueGoal) valueGoal}) {
    assert(() {
      if (yesNoGoal == null &&
          countGoal == null &&
          timerGoal == null &&
          valueGoal == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _GoalType.YesNoGoal:
        if (yesNoGoal == null) break;
        return yesNoGoal();
      case _GoalType.CountGoal:
        if (countGoal == null) break;
        return countGoal(this as CountGoal);
      case _GoalType.TimerGoal:
        if (timerGoal == null) break;
        return timerGoal(this as TimerGoal);
      case _GoalType.ValueGoal:
        if (valueGoal == null) break;
        return valueGoal(this as ValueGoal);
    }
  }

  @override
  List<Object> get props => const [];
}

@immutable
abstract class YesNoGoal extends GoalType {
  const YesNoGoal() : super(_GoalType.YesNoGoal);

  factory YesNoGoal.create() = _YesNoGoalImpl;
}

@immutable
class _YesNoGoalImpl extends YesNoGoal {
  const _YesNoGoalImpl() : super();

  @override
  String toString() => 'YesNoGoal()';
}

@immutable
abstract class CountGoal extends GoalType {
  const CountGoal({@required this.countValue}) : super(_GoalType.CountGoal);

  factory CountGoal.create({@required GoalCountValue countValue}) =
      _CountGoalImpl;

  final GoalCountValue countValue;

  /// Creates a copy of this CountGoal but with the given fields
  /// replaced with the new values.
  CountGoal copyWith({GoalCountValue countValue});
}

@immutable
class _CountGoalImpl extends CountGoal {
  const _CountGoalImpl({@required this.countValue})
      : super(countValue: countValue);

  @override
  final GoalCountValue countValue;

  @override
  _CountGoalImpl copyWith({Object countValue = superEnum}) => _CountGoalImpl(
        countValue: countValue == superEnum
            ? this.countValue
            : countValue as GoalCountValue,
      );
  @override
  String toString() => 'CountGoal(countValue: ${this.countValue})';
  @override
  List<Object> get props => [countValue];
}

@immutable
abstract class TimerGoal extends GoalType {
  const TimerGoal({@required this.timeValue}) : super(_GoalType.TimerGoal);

  factory TimerGoal.create({@required GoalTimeValue timeValue}) =
      _TimerGoalImpl;

  final GoalTimeValue timeValue;

  /// Creates a copy of this TimerGoal but with the given fields
  /// replaced with the new values.
  TimerGoal copyWith({GoalTimeValue timeValue});
}

@immutable
class _TimerGoalImpl extends TimerGoal {
  const _TimerGoalImpl({@required this.timeValue})
      : super(timeValue: timeValue);

  @override
  final GoalTimeValue timeValue;

  @override
  _TimerGoalImpl copyWith({Object timeValue = superEnum}) => _TimerGoalImpl(
        timeValue: timeValue == superEnum
            ? this.timeValue
            : timeValue as GoalTimeValue,
      );
  @override
  String toString() => 'TimerGoal(timeValue: ${this.timeValue})';
  @override
  List<Object> get props => [timeValue];
}

@immutable
abstract class ValueGoal extends GoalType {
  const ValueGoal({@required this.value, @required this.unit})
      : super(_GoalType.ValueGoal);

  factory ValueGoal.create(
      {@required GoalValue value, @required GoalUnit unit}) = _ValueGoalImpl;

  final GoalValue value;

  final GoalUnit unit;

  /// Creates a copy of this ValueGoal but with the given fields
  /// replaced with the new values.
  ValueGoal copyWith({GoalValue value, GoalUnit unit});
}

@immutable
class _ValueGoalImpl extends ValueGoal {
  const _ValueGoalImpl({@required this.value, @required this.unit})
      : super(value: value, unit: unit);

  @override
  final GoalValue value;

  @override
  final GoalUnit unit;

  @override
  _ValueGoalImpl copyWith(
          {Object value = superEnum, Object unit = superEnum}) =>
      _ValueGoalImpl(
        value: value == superEnum ? this.value : value as GoalValue,
        unit: unit == superEnum ? this.unit : unit as GoalUnit,
      );
  @override
  String toString() => 'ValueGoal(value: ${this.value}, unit: ${this.unit})';
  @override
  List<Object> get props => [value, unit];
}

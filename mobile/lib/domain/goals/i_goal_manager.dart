// Package imports:
import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';
import 'package:meta/meta.dart';

// Project imports:
import 'package:akrasia/domain/core/unique_id.dart';
import 'goal.dart';
import 'goal_failure.dart';
import 'goal_state.dart';

// Interface to manipulate goals and associated data.
abstract class IGoalManager {
  // SPECS.
  // TODO: CRUD data
  // TODO: visualiser données d'un goal (stats, courbe, ...)

  // Returns the list of goal states at the specified date [fromDate] or a failure
  Stream<Either<GoalFailure, KtList<GoalState>>> watchAll(DateTime fromDate);

  // create a new goal
  Future<Either<GoalFailure, Unit>> create({@required Goal goal});

  // update an existing goal
  Future<Either<GoalFailure, Unit>> update({@required Goal goal});

  // delete an existing goal with all its data
  Future<Either<GoalFailure, Unit>> delete({@required UniqueId goalId});

  // allows to add, update, delete data to/from goals
  // Future<Either<GoalFailure, Unit>> addData({@required Goal goalId, @required GoalData data});
  // Future<Either<GoalFailure, Unit>> updateData({@required Goal goalId, @required GoalData data});
  // Future<Either<GoalFailure, Unit>> deleteData({@required Goal goalId, @required GoalData data});
}

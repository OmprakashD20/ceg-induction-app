import 'package:fpdart/fpdart.dart';

import "errors.dart";

typedef FutureEither<T> = Future<Either<Failure, T>>;

typedef FutureVoid = FutureEither<void>;
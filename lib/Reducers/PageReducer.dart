
import 'package:flutter_native/Actions/PageActions.dart';

import 'AppState.dart';

final changePageReducer = (AppState state, PageChangeAction action) =>
    AppState(currentPage: action.newPage, todos: state.todos);

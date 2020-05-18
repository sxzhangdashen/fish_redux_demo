import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

import 'action.dart';
import 'state.dart';

Reducer<RegisterState> buildReducer() {
  return asReducer(
    <Object, Reducer<RegisterState>>{
      RegisterAction.querySuccess: _querySuccess,
    },
  );
}

RegisterState _querySuccess(RegisterState state, Action action) {
  final RegisterState newState = state.clone();
  final List<DropdownMenuItem<String>> companyType =<DropdownMenuItem<String>>[];
  for (String key in action.payload['company_business_type']) {
    final DropdownMenuItem<String> menuItem = DropdownMenuItem<String>(
      value: key,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(key),
        ],
      ),
    );
    companyType.add(menuItem);
  }

  final List<DropdownMenuItem<String>> companyAttendShows =<DropdownMenuItem<String>>[];
  for (String key in action.payload['company_attend_shows']) {
    final DropdownMenuItem<String> menuItem = DropdownMenuItem<String>(
      value: key,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(key),
        ],
      ),
    );
    companyAttendShows.add(menuItem);
  }

  final List<DropdownMenuItem<String>> companyFocusType =<DropdownMenuItem<String>>[];
  for (String key in action.payload['company_focus_type']) {
    final DropdownMenuItem<String> menuItem = DropdownMenuItem<String>(
      value: key,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(key),
        ],
      ),
    );
    companyFocusType.add(menuItem);
  }

  final List<DropdownMenuItem<String>> companySize =<DropdownMenuItem<String>>[];
  for (String key in action.payload['company_size']) {
    final DropdownMenuItem<String> menuItem = DropdownMenuItem<String>(
      value: key,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(key),
        ],
      ),
    );
    companySize.add(menuItem);
  }
  newState.companyBussniessType=companyType;
  newState.companySize=companySize;
  newState.companyAttendShows=companyAttendShows;
  newState.companyFoucsType=companyFocusType;
  return newState;
}

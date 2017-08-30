/// <reference path="redux-client.d.ts" />

// NOTE: this is the ManageIQ Redux API.

export function getStore() {
  return ManageIQ.redux.store;
}

export function addReducer(reducer) {
  return ManageIQ.redux.addReducer(reducer);
}

export function applyReducerHash(reducers, state, action) {
  return ManageIQ.redux.applyReducerHash(reducers, state, action);
}

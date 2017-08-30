import { IMiqAction, AppReducer, IMiqReducerHash, AppState } from './redux-types';

const reducers: Set<AppReducer> = new Set();

export const rootReducer: AppReducer = (state: AppState = {}, action: IMiqAction) => {
  let newState = state;

  reducers.forEach(reducer => {
    newState = reducer(newState, action);
  });

  return newState;
};

export function addReducer(reducer: AppReducer): () => void {
  reducers.add(reducer);

  return () => {
    reducers.delete(reducer);
  }
}

export function applyReducerHash(reducers: IMiqReducerHash, state: AppState, action: IMiqAction): AppState {
  let newState = state;

  if (reducers.hasOwnProperty(action.type)) {
    newState = reducers[action.type](state, action);
  }

  return newState;
}

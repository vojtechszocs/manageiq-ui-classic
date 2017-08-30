import { createStore, applyMiddleware, compose } from 'redux';
import { rootReducer } from './reducer';
import { AppState, MiqStore } from './redux-types';

export function configureStore(initialState?: AppState): MiqStore {
  const middlewares = [];

  const composeEnhancers = window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ || compose;
  const enhancer = composeEnhancers(
    applyMiddleware(...middlewares)
  );

  return createStore<AppState>(
    rootReducer,
    initialState!,
    enhancer
  );
}

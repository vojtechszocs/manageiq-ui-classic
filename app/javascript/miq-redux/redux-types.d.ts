import { Reducer, Action, Store } from 'redux';

/**
 * State of the ManageIQ application.
 *
 * Its shape depends on specific `AppReducer` functions added through
 * `ManageIQ.redux` API. Therefore, the shape is dynamic and declared
 * simply as `Object`.
 */
export type AppState = Object;

/**
 * Redux store associated with the ManageIQ application.
 *
 * Provides methods to read the state, dispatch actions and subscribe
 * to changes.
 */
export type MiqStore = Store<AppState>;

/**
 * Reducer function that operates on `AppState`.
 *
 * As per Redux design, reducers should be pure functions without side
 * effects.
 *
 * Returns new state, if the given `action` was acted upon. Otherwise,
 * original state is returned.
 */
export type AppReducer = Reducer<AppState>;

/**
 * Reducer hash is an object containing Redux action types as keys and
 * reducer functions as values.
 *
 * This allows a representation that co-locates all relevant reducer
 * functions into a single object, effectively avoiding `switch` blocks
 * in reducer implementations.
 */
export interface IMiqReducerHash {
  [propName: string]: AppReducer;
}

/**
 * Action to be dispatched into ManageIQ Redux store.
 *
 * By convention, any data associated with the action should be contained
 * within the `payload` property.
 */
export interface IMiqAction extends Action {
  payload?: any;
}

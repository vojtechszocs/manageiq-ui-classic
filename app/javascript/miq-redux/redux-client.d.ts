import { AppState, AppReducer, IMiqReducerHash, IMiqAction, MiqStore } from './redux-types';

// NOTE: this file should be pushed into DefinitelyTyped repository
// to be consumed by npm clients as @types/manageiq-redux package.

/**
 * Returns the ManageIQ Redux store.
 */
export function getStore(): MiqStore;

/**
 * Add new `AppReducer` to ManageIQ Redux reducer chain.
 */
export function addReducer(reducer: AppReducer): () => void;

/**
 * Apply the given reducer hash, providing `action` and `state` to operate on.
 *
 * If the reducer hash contains reducer for `action.type`, invoke that reducer
 * and return the resulting state. Otherwise, return the original state.
 */
export function applyReducerHash(reducers: IMiqReducerHash, state: AppState, action: IMiqAction): AppState;

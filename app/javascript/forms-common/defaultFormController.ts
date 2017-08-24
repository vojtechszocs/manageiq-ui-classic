import { getStore, addReducer, applyReducerHash } from '../miq-redux/lib';
import { MiqStore, IMiqReducerHash, AppState, Action } from '../miq-redux/redux-types';

export interface IUnbindReduxReducers {
  redux?: () => void;
  reducer?: () => void;
}

export abstract class DefaultFormController {
  protected unbind: IUnbindReduxReducers = {};
  protected reduxStore: MiqStore;

  constructor(reducersHash?: IMiqReducerHash) {
    if (reducersHash) {
      this.unbind.reducer = addReducer(
        (state: AppState, action: Action) => applyReducerHash(reducersHash, state, action)
      );
    }
    this.reduxStore = getStore();
    this.unbind.redux = this.reduxStore.subscribe(() => this.updateStore());
  }

  protected updateStore() {
    throw new Error('Controller should implement updateStore method');
  }

  public $onDestroy() {
    this.unbind.redux();
    if (this.unbind.reducer) {
      this.unbind.reducer();
    }
  }
}
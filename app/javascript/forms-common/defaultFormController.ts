import { getStore, addReducer, applyReducerHash } from '../miq-redux/redux-client';
import { AppState, MiqStore, IMiqReducerHash, IMiqAction } from '../miq-redux/redux-types';

interface IUnbindRedux {
  store?: () => void;
  reducer?: () => void;
}

export abstract class DefaultFormController {
  protected store: MiqStore;
  private unbind: IUnbindRedux = {};

  constructor(reducers?: IMiqReducerHash) {
    this.store = getStore();
    this.unbind.store = this.store.subscribe(() => this.updateFromStore());

    if (reducers) {
      this.unbind.reducer = addReducer(
        (state: AppState, action: IMiqAction) => applyReducerHash(reducers, state, action)
      );
    }
  }

  public updateFromStore() {
    throw new Error('Controller should implement updateFromStore method');
  }

  public $onDestroy() {
    this.unbind.store();
    this.unbind.reducer && this.unbind.reducer();
  }
}

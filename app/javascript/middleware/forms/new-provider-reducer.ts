import { AppState, IMiqAction, IMiqReducerHash } from '../../miq-redux/redux-types';
import { INIT_NEW_PROVIDER, UPDATE_NEW_PROVIDER } from './new-provider-action';
import { defaultsDeep, merge } from 'lodash';

function initNewProvider(state: AppState, action: IMiqAction): AppState {
  return {
    ...defaultsDeep(state, {
      providers: {
        middleware: {
          hawkular: {
            newProvider: {
              name: '',
              type: undefined
            }
          }
        }
      }
    })
  }
}

function updateNewProvider(state: AppState, action: IMiqAction): AppState {
  return {
    ...merge(state, {
      providers: {
        middleware: {
          hawkular: {
            newProvider: action.payload
          }
        }
      }
    })
  }
}

export const reducers: IMiqReducerHash = {
  [INIT_NEW_PROVIDER]: initNewProvider,
  [UPDATE_NEW_PROVIDER]: updateNewProvider
};

import { AppState, IMiqReducerHash } from '../../miq-redux/redux-types';
import { merge, defaultsDeep } from 'lodash';

export const INIT_NEW_PROVIDER: string = 'INIT_NEW_PROVIDER_HAWKULAR'
export const UPDATE_NEW_PROVIDER = 'UPDATE_NEW_PROVIDER_HAWKULAR';

function initNewProvider(state, action): AppState {
  const newProvider = {
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
  };
  return { ...defaultsDeep(state, newProvider) }
}

function updateNewProvider(state, action): AppState {
  const newProvider = {
    providers: {
      middleware: {
        hawkular: {
          newProvider: action.payload
        }
      }
    }
  };
  console.log({ ...merge(state, newProvider) });
  return { ...merge(state, newProvider) }
}

export const reducers: IMiqReducerHash = {
  [INIT_NEW_PROVIDER]: initNewProvider,
  [UPDATE_NEW_PROVIDER]: updateNewProvider
};

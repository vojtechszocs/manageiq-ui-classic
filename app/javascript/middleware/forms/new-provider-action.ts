import { IMiqAction } from '../../miq-redux/redux-types';

export const INIT_NEW_PROVIDER = 'INIT_NEW_PROVIDER_HAWKULAR'
export const UPDATE_NEW_PROVIDER = 'UPDATE_NEW_PROVIDER_HAWKULAR';

export function initNewProvider(): IMiqAction {
  return {
    type: INIT_NEW_PROVIDER
  };
}

export function updateNewProvider(payload: Object): IMiqAction {
  return {
    type: UPDATE_NEW_PROVIDER,
    payload
  };
}

import { addReducer, applyReducerHash } from './reducer';
import { configureStore } from './store';
import { MiqStore } from './redux-types';

const store: MiqStore = configureStore({});

ManageIQ.redux = {
  store,
  addReducer,
  applyReducerHash
};

import * as ng from 'angular';
import { INIT_NEW_PROVIDER, reducers, UPDATE_NEW_PROVIDER } from './new-provider-reducer';
import { DefaultFormController } from '../../forms-common/defaultFormController';

export default class NewProviderForm implements ng.IComponentOptions {
  public templateUrl: string = '/static/middleware/new-provider.html.haml';
  public controller: any = NewProviderController;
  public controllerAs: string = 'newProv';
  public bindings: any = {
    types: '<',
    formFieldsUrl: '@',
    novalidate: '@',
    createUrl: '@'
  };
}

class NewProviderController extends DefaultFormController {
  public types: any[];
  public newProvider: any;
  private formFieldsUrl: string;
  private novalidate: boolean;
  private createUrl: string;
  private selects: NodeListOf<HTMLSelectElement>;

  public static $inject = ['$element', '$scope'];

  constructor(private $element: Element, private $scope: ng.IScope) {
    super(reducers);
  }

  public updateStore() {
    const currState: any = this.reduxStore.getState();
    this.newProvider = { ...currState.providers.middleware.hawkular.newProvider };
  }

  public $onInit() {
    this.selects = this.$element.querySelectorAll('select');
    this.reduxStore.dispatch({ type: INIT_NEW_PROVIDER });
    setTimeout(() => (<any>angular.element(this.selects)).selectpicker('refresh'));
  }

  public onChangedProvider() {
    this.reduxStore.dispatch({ type: UPDATE_NEW_PROVIDER, payload: this.newProvider });
  }
}

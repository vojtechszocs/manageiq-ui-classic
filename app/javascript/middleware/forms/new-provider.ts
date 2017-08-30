import * as ng from 'angular';
import { initNewProvider, updateNewProvider } from './new-provider-action';
import { reducers } from './new-provider-reducer';
import { DefaultFormController } from '../../forms-common/defaultFormController';

export default class NewProviderForm implements ng.IComponentOptions {
  public templateUrl: string = '/static/middleware/new-provider.html.haml';
  public controller: any = NewProviderController;
  public controllerAs: string = 'newProv';
  public bindings: any = {
    types: '<',
    formFieldsUrl: '@',
    createUrl: '@',
    novalidate: '@'
  };
}

class NewProviderController extends DefaultFormController {
  private componentState: Object;
  private types: Array<any>;
  private formFieldsUrl: string;
  private createUrl: string;
  private novalidate: boolean;
  private selects: NodeListOf<HTMLSelectElement>;

  public static $inject = ['$element', '$scope'];

  constructor(private $element: Element, private $scope: ng.IScope) {
    super(reducers);
  }

  public updateFromStore() {
    const currState: any = this.store.getState();
    this.componentState = { ...currState.providers.middleware.hawkular.newProvider };
  }

  public $onInit() {
    this.selects = this.$element.querySelectorAll('select');
    this.store.dispatch(initNewProvider());
    setTimeout(() => (<any>angular.element(this.selects)).selectpicker('refresh'));
  }

  public onDataChange() {
    this.store.dispatch(updateNewProvider(this.componentState));
  }
}

import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['step']

  goToNext(event) {
    const nextStep = event.target.dataset.nextStep - 1;
    const actualStep = event.target.dataset.nextStep;

    this.stepTargets[nextStep].classList.add("d-none");
    this.stepTargets[actualStep].classList.remove("d-none");
  }

  goToPrevious(event) {
    const previousStep = event.target.dataset.previousStep - 1;
    const actualStep = event.target.dataset.previousStep;

    this.stepTargets[actualStep].classList.add("d-none");
    this.stepTargets[previousStep].classList.remove("d-none");
  }
}

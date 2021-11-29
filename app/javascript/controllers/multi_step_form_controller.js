
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["step"]

  goToNext(event) {
    event.preventDefault();
    const next = this.stepTargets[event.currentTarget.dataset.nextStep];
    const current = this.stepTargets[event.currentTarget.dataset.nextStep - 1];
    next.classList.remove("d-none");
    current.classList.add("d-none");
    // coger al elemento en el index next-step: quitarle el d-none

    // coger al elemento en el index - 1: agregarle el d-none
  }
}

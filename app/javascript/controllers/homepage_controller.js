import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ['submit']

  connect() {
    console.log(this.submitTargets)
    //   // this.submitTargets[0].querySelector("input").classList.toggle("disabled")
  }

  toggle() {
    this.submitTargets[0].querySelector("input").classList.remove("disabled")
  }
}

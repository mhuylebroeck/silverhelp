import { Controller } from "stimulus"
import flatpickr from "flatpickr";

export default class extends Controller {
  connect() {
     const config = {
      enableTime: true,
      dateFormat: "Y-m-d H:i",
      altInput: true
    }

    flatpickr(".datepicker", config);

  }
}

import flatpickr  from "flatpickr";
import { Controller } from "@hotwired/stimulus";


// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = ["input"]

  connect() {
    this.inputTargets.forEach((input) => {
      flatpickr(input, {
        altInput: true,
        minDate: "today"
      });
    })
  }
}

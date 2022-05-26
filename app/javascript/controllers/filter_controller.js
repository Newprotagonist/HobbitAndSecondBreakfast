import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter"
export default class extends Controller {
  static targets = ['price', 'value']
  connect() {
    console.log("Hello Bastien, you're very good at Super Smash")
    this.priceTarget.value = 0
  }

  display() {
    console.log(this.priceTarget.value);
    this.valueTarget.innerText = `${this.priceTarget.value}`
  }
}

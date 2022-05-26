import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter"
export default class extends Controller {
  static targets = ['price', 'value']
  connect() {
    this.priceTarget.value = 0
  }

  display() {
    this.valueTarget.innerText = `${this.priceTarget.value}`
  }
}

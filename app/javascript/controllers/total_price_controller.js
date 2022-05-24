import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="total-price"
export default class extends Controller {
  static targets = ["start", "end", "total", "daily"];

  connect() {
  }
  calc() {
    let startDate = Date.parse(this.startTarget.value);
    let endDate = Date.parse(this.endTarget.value);
    let totalPrice = this.dailyTarget.innerHTML * (endDate - startDate) / 86400000;
    this.totalTarget.innerHTML = isNaN(totalPrice) ? 0 : totalPrice;
  }
}

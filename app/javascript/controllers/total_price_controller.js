import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="total-price"
export default class extends Controller {
  static targets = ["start", "end", "total", "daily"];

  connect() {
    console.log("connected");
    console.log(this.element);
  }
  calc() {
    let startDate = Date.parse(this.startTarget.value);
    let endDate = Date.parse(this.endTarget.value);
    console.log(endDate - startDate);
    this.totalTarget.innerHTML = this.dailyTarget.innerHTML * (endDate - startDate) / 86400000;
  }
}

import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modale"
export default class extends Controller {
  static targets = ["updateForm"]

  connect() {
    this.updateFormTarget.classList.toggle("display-none")
  }

  show() {
    this.updateFormTarget.classList.toggle("active")
    this.updateFormTarget.classList.toggle("display-none")
  }
}

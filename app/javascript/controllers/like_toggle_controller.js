import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="like-toggle"
export default class extends Controller {
  static targets = ["icon"]

  toggle(event) {
    event.stopPropagation();
    event.preventDefault(); 

    const icon = this.iconTarget
    icon.classList.toggle("bi-heart")
    icon.classList.toggle("bi-heart-fill")
  }
}

import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="comment-counter"
export default class extends Controller {
  static targets = ["textarea", "counter", "warning"]
  
  connect() {
    this.updateCount()
  }

  updateCount() {
    const length = this.textareaTarget.value.length
    this.counterTarget.textContent = `${length} / 300`

    if (length > 300) {
      this.counterTarget.classList.add("text-danger")
      this.warningTarget.classList.remove("invisible")
      this.textareaTarget.classList.add("is-invalid")
    } 
    else {
      this.counterTarget.classList.remove("text-danger")
      this.warningTarget.classList.add("invisible")
      this.textareaTarget.classList.remove("is-invalid")
    }
  }
}

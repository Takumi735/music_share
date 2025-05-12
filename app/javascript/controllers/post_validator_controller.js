import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="post-validator"
export default class extends Controller {
  static targets = ["track", "submit"]

  connect() {
    this.toggleSubmit()
  }

  trackTargetConnected() {
    this.toggleSubmit()
  }

  toggleSubmit() {
    const isTrackSelected = this.trackTarget.value.trim() !== ""
    this.submitTarget.disabled = !isTrackSelected
  }
}

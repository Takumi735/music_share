import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="like-toggle"
export default class extends Controller {
  static targets = ["icon"]
  static values = { liked: Boolean, postId: Number }

  connect() {
    this.updateIcon()
  }

  toggle(event) {
    event.preventDefault()
    event.stopPropagation()

    const method = this.likedValue ? "DELETE" : "POST"
    const url = `/posts/${this.postIdValue}/like`

    fetch(url, {
      method: method,
      headers: {
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content,
        "Content-Type": "application/json"
      },
      credentials: "same-origin"
    }).then(response => {
      if (response.ok) {
        this.likedValue = !this.likedValue
        this.updateIcon()
      }
    })
  }

  updateIcon() {
    const icon = this.iconTarget
    if (this.likedValue) {
      icon.classList.remove("bi-heart")
      icon.classList.add("bi-heart-fill")
    } else {
      icon.classList.remove("bi-heart-fill")
      icon.classList.add("bi-heart")
    }
  }
}

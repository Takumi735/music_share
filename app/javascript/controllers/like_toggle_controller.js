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
        if (this.likedValue) {
          this.showToast("いいねしました！")
        } else {
          this.showToast("いいねを取り消しました")
        }
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

  showToast(message) {
    const toastContainer = document.getElementById("toast-container")
    if (!toastContainer) return

    const toastEl = document.createElement("div")
    toastEl.className = "toast align-items-center border-0"
    toastEl.setAttribute("role", "alert")
    toastEl.setAttribute("aria-live", "assertive")
    toastEl.setAttribute("aria-atomic", "true")
    toastEl.setAttribute("data-bs-autohide", "true")
    toastEl.setAttribute("data-bs-delay", "3000")
    toastEl.innerHTML = `
    <div class="toast-header text-success">
      <i class="fas fa-check-circle me-1"></i>
      <strong class="me-auto">完了</strong>
      <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
    </div>
    <div class="toast-body">
      ${message}
    </div>
    `

    toastContainer.appendChild(toastEl)

    const bsToast = new bootstrap.Toast(toastEl)
    bsToast.show()

    bsToast._element.addEventListener('hidden.bs.toast', () => {
      toastEl.remove()
    })
  }
}

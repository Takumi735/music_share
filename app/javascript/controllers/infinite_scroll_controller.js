import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="infinite-scroll"
export default class extends Controller {
  static values = {
    url: String
  }

  connect() {
    this.observer = new IntersectionObserver(entries => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          this.loadMore()
        }
      })
    })
    this.observer.observe(this.element)
  }

  disconnect() {
    this.observer.disconnect()
  }

  loadMore() {
    if (this.loading) return
    this.loading = true

    fetch(this.urlValue, {
      headers: { Accept: "text/vnd.turbo-stream.html" }
    })
      .then(response => response.text())
      .then(html => {
        document.body.insertAdjacentHTML("beforeend", html)
        this.loading = false
        this.element.remove()
      })
  }
}

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.element.querySelectorAll('.toast').forEach(toastEl => {
      const toast = new bootstrap.Toast(toastEl)
      toast.show()
    })
  }
}

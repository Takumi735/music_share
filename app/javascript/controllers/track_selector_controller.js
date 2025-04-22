import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  select(event) {
    const target = event.currentTarget

    const id = target.dataset.trackSelectorId
    const title = target.dataset.trackSelectorTitle
    const artist = target.dataset.trackSelectorArtist
    const image = target.dataset.trackSelectorImage

    document.getElementById("post_spotify_track_id").value = id
    document.getElementById("post_song_title").value = title
    document.getElementById("post_artist_name").value = artist

    const preview = document.getElementById("selected-track")
    preview.innerHTML = `
      <div class="d-flex align-items-center mb-3 p-2 bg-light rounded w-100">
        <div class="me-3">
          <img src="${image}" alt="${title}" class="track-image rounded">
        </div>
        <div class="flex-grow-1">
          <p class="mb-0 text-dark fw-bold">${title}</p>
          <p class="mb-0 text-muted small">${artist}</p>
        </div>
        <button type="button" class="btn btn-outline-dark btn-sm" data-bs-toggle="modal" data-bs-target="#trackModal">変更</button>
      </div>
    `;

    const modal = bootstrap.Modal.getInstance(document.getElementById("trackModal"))
    modal.hide()
  }
}

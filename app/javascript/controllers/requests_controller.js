import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "url", "response" ]


  connect() {
    console.log("Connected")
  }

  makeRequest() {
    event.preventDefault()

    const url = this.urlTarget.value
    // Submit the form with AJAX
    fetch('/requests', {
      method: 'POST',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
      },
      body: JSON.stringify({ url: url })
    })
    .then(response => response.json())
    .then(data => {
      // Update the DOM with the response
      this.responseTarget.textContent = JSON.stringify(data, null, 2)
    })
    .catch(error => {
      console.error('Error:', error)
      // Handle error if needed
    })
  }
}
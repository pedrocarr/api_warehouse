import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "url", "response" ]


  connect() {
    console.log("Connected")
  }

  makeRequest() {
    event.preventDefault()

    const url = this.urlTarget.value

    if (url === "") {
      alert("URL cannot be blank");
      return;
    }

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
      this.responseTarget.querySelector('code').textContent = `
      {
        Status Code: ${JSON.stringify(data.status_code)},
        Body: ${JSON.stringify(data.body, null, 2).replace(/[\\]/g, '')}
      }
      `
      Prism.highlightElement(this.responseTarget.querySelector('code'));
    })
    .catch(error => {
      this.responseTarget.querySelector('code').textContent = `
      {
        Error: ${error.message}
      }
      `
    })
  }
}
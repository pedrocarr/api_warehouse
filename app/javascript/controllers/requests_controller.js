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
    .then(response =>
      response.json()
    )
    .then(data => {
      const formattedJson = JSON.stringify(JSON.parse(data.body), null, 2);
      this.responseTarget.querySelector('code').textContent = `${formattedJson}`
      Prism.highlightElement(this.responseTarget.querySelector('code'));
    })
    .catch(error => {
      console.log(error);
      this.responseTarget.querySelector('code').textContent = `
      Something went wrong with the request, check endpoint!
      `
    })
  }
}
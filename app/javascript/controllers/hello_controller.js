import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "name", "output" ]
  connect() {
    console.log("i am connected")
  }

  greet() {
    this.outputTarget.textContent =
    `Hello, ${this.nameTarget.value}!`
  }
}

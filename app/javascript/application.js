import "@hotwired/turbo-rails"
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
import Rails from "@rails/ujs"
import "chartkick"
import "chart.js"

Rails.start()

eagerLoadControllersFrom("controllers", application)

document.addEventListener("DOMContentLoaded", () => {
  const toggle = document.getElementById("toggle-theme")
  if (toggle) {
    toggle.addEventListener("click", () => {
      document.documentElement.classList.toggle("dark")
      console.log("🌗 Dark mode toggled")
    })
  }
})
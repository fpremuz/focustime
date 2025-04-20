import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.timer = null
    this.seconds = 0
    this.display = document.getElementById("timer")
    this.startBtn = document.getElementById("start-btn")
    this.stopBtn = document.getElementById("stop-btn")
    this.taskSelect = document.getElementById("task-select")
    this.taskLabel = document.getElementById("selected-task-name")
    this.updateTaskLabel()
    this.taskSelect.addEventListener("change", () => this.updateTaskLabel())
  }

  start() {
    if (this.timer) return

    this.seconds = 0
    this.updateDisplay()
    this.startBtn.disabled = true
    this.stopBtn.classList.remove("hidden")

    this.timer = setInterval(() => {
      this.seconds++
      this.updateDisplay()
    }, 1000)
  }

  stop() {
    clearInterval(this.timer)
    this.timer = null
    this.stopBtn.classList.add("hidden")
    this.startBtn.disabled = false

    const selectedTaskId = document.getElementById("task-select")?.value;
    if (!selectedTaskId) {
      alert("❌ Please select a task before stopping the session.")
      return
    }
  
    fetch("/focus_sessions", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").content
      },
      body: JSON.stringify({
        duration: this.seconds,
        task_id: selectedTaskId
      })
    }).then(response => {
      if (response.ok) {
        alert(`✅ Session saved! Duration: ${this.seconds} seconds`)
        location.reload() 
      } else {
        alert("❌ Failed to save session")
      }
    })
  }

  updateDisplay() {
    const minutes = Math.floor(this.seconds / 60).toString().padStart(2, "0")
    const seconds = (this.seconds % 60).toString().padStart(2, "0")
    this.display.textContent = `${minutes}:${seconds}`
  }

  updateTaskLabel() {
    const selectedOption = this.taskSelect.options[this.taskSelect.selectedIndex]
    this.taskLabel.textContent = selectedOption ? `– ${selectedOption.text}` : ""
  }
}
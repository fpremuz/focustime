# ⏱️ FocusTime

**FocusTime** is a minimalist task timer built with Ruby on Rails. It helps you stay focused by tracking dedicated work sessions per task.

---

## 📋 Features

- Create and manage tasks
- Start and stop focus sessions for each task
- View total session history per task
- Clean and intuitive interface
- Built using modern Rails practices

---

## 🧰 Tech Stack

- **Framework:** Ruby on Rails 7
- **Database:** PostgreSQL
- **Front-End:** ERB (HTML/CSS), Bootstrap 
- **Tools:** Hotwire (Turbo/Stimulus), Git, WSL 2 (Ubuntu)

---

## 🚀 Getting Started

### Prerequisites

Make sure you have these installed:

- Ruby 3.x
- Rails 7.x
- PostgreSQL
- Bundler

### Setup

Clone the repo and set up the project:

```bash
git clone https://github.com/YOUR_USERNAME/focustime.git
cd focustime
bundle install
rails db:create db:migrate
rails server

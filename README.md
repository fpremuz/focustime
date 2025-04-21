# ⏱️ FocusTime

**FocusTime** is a minimalist task timer built with Ruby on Rails. It helps you stay focused by tracking dedicated work sessions per task.

## 🚀 Deployment

🚀 [Live Demo](https://focustime.onrender.com)

This app is deployed on [Render](https://render.com). It uses:

- PostgreSQL (hosted on Render)
- Dockerized Rails app
- Free Render web service

To deploy it yourself:
1. Fork this repo
2. Push to your own GitHub
3. Link to [Render](https://render.com) and follow their Rails deployment guide

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

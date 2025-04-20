import { application } from "controllers/application"
import { definitionsFromContext } from "@hotwired/stimulus-loading"

const context = require.context(".", true, /\.js$/)
application.load(definitionsFromContext(context))
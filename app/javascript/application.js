// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@rails/request.js"
import { FetchRequest } from "@rails/request.js"

const request = new FetchRequest('post', "my_endpoint", { body: JSON.stringify({ name: 'Request.JS' }) })
console.log(request)
const response = await request.perform()
console.log(response)

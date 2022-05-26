// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import FilterController from "./filter_controller.js"
application.register("filter", FilterController)

import FlatpickrController from "./flatpickr_controller.js"
application.register("flatpickr", FlatpickrController)

import HelloController from "./hello_controller.js"
application.register("hello", HelloController)

import TotalPriceController from "./total_price_controller.js"
application.register("total-price", TotalPriceController)

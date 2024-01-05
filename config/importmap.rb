# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true


pin "@hotwired/stimulus", to: "https://ga.jspm.io/npm:@hotwired/stimulus@3.2.1/dist/stimulus.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "scriptristorante"
pin "carousel"
pin "password"
pin "ristorante_maps"
pin "maps"
pin "filters"

pin "stimulus-rails-nested-form", to: "https://ga.jspm.io/npm:stimulus-rails-nested-form@4.1.0/dist/stimulus-rails-nested-form.mjs"
pin "leaflet", to: "https://ga.jspm.io/npm:leaflet@1.9.4/dist/leaflet-src.js"
pin "leaflet-geosearch", to: "https://ga.jspm.io/npm:leaflet-geosearch@3.8.0/dist/geosearch.module.js"
pin "leaflet-css", to: "https://ga.jspm.io/npm:leaflet-css@0.1.0/dist/leaflet.css.min.js"
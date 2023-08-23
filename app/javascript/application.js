// Entry point for the build script in your package.json
// import * as bootstrap from "bootstrap"
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"

// чтобы запустить все необходимые скрипты - добавляем:
Rails.start()
Turbolinks.start()
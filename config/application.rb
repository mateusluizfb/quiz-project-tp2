require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module QuizProjectTp2
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.assets.paths << Rails.root.join("app", "assets", "fonts")
    config.assets.paths << Rails.root.join("app", "assets", "fonts", "glyphicons")
    config.assets.paths << Rails.root.join("app", "assets", "fonts", "lato")

    config.middleware.use(StackProf::Middleware, enabled:true, mode: :wall, interval: 1000, save_every: 5)
  end
end

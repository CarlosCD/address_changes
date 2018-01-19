require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

# Fixing a helpers issue (see https://github.com/rails/rails/pull/24822)
# Original file: actionpack/lib/action_controller/metal/helpers.rb
# It probably won't be necessary in future rails releases.
module ActionController
  module Helpers
    module ClassMethods
      def all_helpers_from_path(path)
        helpers = Array(path).flat_map do |_path|
          extract = /^#{Regexp.quote(_path.to_s)}\/?(.*)_helper.rb$/i  # This last char (case insensitive regex)
          names = Dir["#{_path}/**/*_helper.rb"].map { |file| file.sub(extract, '\1') }
          names.sort!
        end
        helpers.uniq!
        helpers
      end
    end
  end
end

module Sensors
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
  end
end

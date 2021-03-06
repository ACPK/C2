require "codeclimate-test-reporter"

# Only run SimpleCov on Circle CI because it slows down the developer
# experience when run locally.
if ENV["CIRCLE_ARTIFACTS"]
  SimpleCov.formatters = [
    SimpleCov::Formatter::HTMLFormatter,
    CodeClimate::TestReporter::Formatter
  ]
  SimpleCov.start "rails" do
    if ENV["CIRCLE_ARTIFACTS"]
      dir = File.join(ENV["CIRCLE_ARTIFACTS"], "coverage")
      coverage_dir(dir)
    end
  end
end

require "webmock/rspec"
# localhost needed for omniauth
WebMock.disable_net_connect!(allow_localhost: true, allow: "codeclimate.com:443")

require "rack_session_access/capybara"

require "capybara/poltergeist"
Capybara.register_driver :poltergeist do |app|
  options = {
    timeout: 60,
    debug: ENV["CAPYBARA_DEBUG"] || false
  }
  Capybara::Poltergeist::Driver.new(app, options)
end
Capybara.javascript_driver = :poltergeist
Capybara.default_max_wait_time = 10
Capybara.server do |app, port|
  require "rack/handler/puma"
  Rack::Handler::Puma.run(app, Port: port)
end

require "pundit/rspec"
require "factory_girl_rails"
require "site_prism"

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.include FactoryGirl::Syntax::Methods
  config.raise_errors_for_deprecations!
  config.backtrace_exclusion_patterns << %r{/gems/}
  config.order = :random
end

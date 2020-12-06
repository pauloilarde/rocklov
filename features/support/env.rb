require "allure-cucumber"
require "capybara"
require "capybara/cucumber"
require "faker"
require "mongo"

CONFIG = YAML.load_file(File.join(Dir.pwd, "features/support/config/#{ENV["CONFIG"]}"))

BROWSER = ENV["BROWSER"]

if BROWSER == "firefox"
  @driver = :selenium
elsif BROWSER == "fire_headless"
    @driver = :selenium_headless
elsif BROWSER == "chrome"
  @driver = :selenium_chrome
else
  @driver = :selenium_chrome_headless

  

Capybara.configure do |config|
  config.default_driver = @driver
  config.app_host = CONFIG["url"]
  config.default_max_wait_time = 10
end

AllureCucumber.configure do |config|
  config.results_directory = "/logs"
  config.clean_results_directory = true
end

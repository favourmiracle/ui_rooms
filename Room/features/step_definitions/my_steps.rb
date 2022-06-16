require 'selenium-webdriver'
require 'rspec'

Given(/^I navigate to a room$/) do
  driver = Selenium::WebDriver.for :chrome
  driver.navigate.to 'https://todomvc.com/examples/react/#/'
  #Open a new browser window
  driver.manage.window.maximize
  wait= Selenium::WebDriver::Wait.new(timeout: 20)
  wait until (element = driver.find_element(:class, "new-todo"))
  element.send_keys("type test")
  wait= Selenium::WebDriver::Wait.new(timeout: 20)
  wait until (element = driver.find_element(:link_text, 'Tutorial'))
  element.click if element.displayed?
  sleep 5
  driver.quit
end
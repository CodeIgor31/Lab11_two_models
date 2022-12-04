# frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'

# testing System
RSpec.describe PalindromsController do
    include RSpec::Expectations
    before(:each) do
      @driver = Selenium::WebDriver.for :firefox
      @base_url = 'http://localhost:3000/'
      @driver.manage.timeouts.implicit_wait = 30
      @verification_errors = []
    end
  
    after(:each) do
      @driver.quit
    end
    
    it 'should give an answer' do
      @driver.get('http://localhost:3000')
      @driver.find_element(:id, 'number').send_keys '100'
      @driver.find_element(:id, 'find').click
      verify { expect((@driver.find_element(:id, 'counter').text)).to eq('6') }
    end
  
    it 'should be in database' do
      @driver.get('http://localhost:3000/palindroms/check_page')
      @driver.find_element(:id, 'check').send_keys '100'
      @driver.find_element(:id, 'btn').click
      verify { expect((@driver.find_element(:id, 'msg').text)).to eq('Есть в базе данных') }
    end

    it 'should not be in database' do
        @driver.get('http://localhost:3000/palindroms/check_page')
        @driver.find_element(:id, 'check').send_keys '-123'
        @driver.find_element(:id, 'btn').click
        verify { expect((@driver.find_element(:id, 'wrn').text)).to eq('Нет в базе данных') }
      end
    def verify
      yield
    rescue ExpectationNotMetError => e
      @verification_errors << e
    end
  end
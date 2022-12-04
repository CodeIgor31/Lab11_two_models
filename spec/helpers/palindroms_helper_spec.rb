# frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'

# testing PalindromsController
RSpec.describe PalindromsHelper do
  context 'res_array function check' do
    it 'returns correct array' do
      expect(result_array(11)).to eq([0, 1, 2, 3, 11])
      expect(result_array(0)).to eq([0])
      expect(result_array(-1)).to eq([])
    end
  end
end
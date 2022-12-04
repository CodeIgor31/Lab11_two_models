# frozen_string_literal: true

# helping me
module PalindromsHelper
    def result_array(num)
      arr = (0..num).select do |elem|
        elem.to_s == elem.to_s.reverse && (elem**2).to_s == (elem**2).to_s.reverse
      end
      Array(arr)
    end
  
    def add_to_database(number)
      row = []
      row << { num: number.to_i, result: result_array(number).join(' '),
               count: result_array(number).size,
               squares: result_array(number).map { |el| el**2 }.join(' ') }
      Palindrom.insert_all(row)
    end
  
    def exists(value)
      obj = Palindrom.find_by(num: value)
      arr = obj[:result].split.map(&:to_i)
      sqr = obj[:squares].split.map(&:to_i)
      Hash[arr.zip sqr]
    end
  end
  
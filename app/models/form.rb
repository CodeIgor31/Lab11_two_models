# frozen_string_literal: true

# good
class Form
    include ActiveModel::Serializers::Xml
    include ActiveModel::Model
    include ActiveModel::Validations
    include PalindromsHelper
  
    attr_accessor :numb, :check
    validates :numb, presence: { message: 'не может быть пустым' }
    validates_numericality_of :numb, only_integer: true, greater_than_or_equal_to: 0
  
    def print_res(bool_val)
      number = numb.to_i
      return if number.negative?
      
      if Palindrom.find_by(num: number).nil?
        add_to_database(number)
        bool_val = true
      end
      obj = Palindrom.find_by(num: number)
      arr = obj[:result].split.map(&:to_i)
      sqr = obj[:squares].split.map(&:to_i)
      [Hash[arr.zip sqr], bool_val]
    end
  
    def check_existing
      check_val = check
      if Palindrom.find_by(num: check_val).nil?
        nil
      else
        exists(check_val)
      end
    end
  end
  
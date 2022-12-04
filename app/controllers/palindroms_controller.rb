# frozen_string_literal: true

# Main controller
class PalindromsController < ApplicationController
  def index; end

  def result
    @flag = false
    @number = form_params
    @form = Form.new(@number)
    if @form.valid?
      @hash, @flag = @form.print_res(@flag)
    end
  end

  def check_page; end

  def check_exists
    @check_par = check_form_params
    @check_form = Form.new(@check_par)
    @check_res = @check_form.check_existing
  end

  def check_data_xml
    render xml: Palindrom.all
  end

  private

  def palindrom_params
    params.require(:palindroms).permit(:num, :result, :squares, :count)
  end

  def form_params
    params.permit(:numb)
  end

  def check_form_params
    params.permit(:check)
  end
end

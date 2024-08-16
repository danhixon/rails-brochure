class HomeController < ApplicationController

  def four_zero_four
    render 'four_zero_four', status: 404
  end

  def method_missing
    raise "Hello"
  end
end

class TestsController < ApplicationController
  def index
    @tests = Test.all
  end

  def show
  end
end

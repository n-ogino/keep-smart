class ChartsController < ApplicationController

  def new
    @weight = Chart.new
  end

  def create
    user = User.find_by("#{session[:user_id]}")
    Chart.create(weight_params)
    redirect_to charts_path
  end

  def index
    @user_id = session[:user_id]
    @data = Chart.where(user_id: @user_id)
    @data_weight = @data.pluck(:weight)
    # @date = data.pluck(:created_at)
    # @days = make_date(date)
    user_data = User.find_by(id: @user_id)
    height = user_data.height
    @bmi = bmi_calc(@data_weight, height)
    @start = @data.first
  end
  

  def bmi_calc(weights, height)
    last = weights.last
    calc_height = height / 100.to_f
    bmi = last / calc_height / calc_height
  end


  private
  def weight_params
    params.require(:chart).permit(:weight).merge(user_id: session[:user_id])
  end
  # def make_date(date)
  #   n = []
  #   date.each do |d|
  #     i = d.created_at.strftime('%Y/%m/%d')
  #   end
  #   n << i
  # end

end

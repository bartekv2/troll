class TheftsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @theft = Theft.new(theft_params)

    if @theft.save
      flash[:good_news] = "Congratulations! You've trolled the troll!"
    else
      flash[:bad_news] = "Unfortunately somebody was faster."
    end
    redirect_to thefts_path

  end

  def index
    @cake_id = 1
    @cake_cal = 100
    @time_left = 0
    @theft = Theft.new
    @thefts = Theft.all.order(created_at: :desc)
    @last_50_thefts = Theft.all.order(created_at: :desc).limit(50)
    @top_50_fattest = Theft.group(:user_id).sum(:cake_cal).sort_by{|k, v| v}.reverse.take(50)
    @users = User.all
    @time_now = Time.now.to_i
    @exact_time = Time.now.to_f
    unless @thefts.empty?
      @last_thief = @thefts.first.user.username
      @cake_id = Theft.last.next_cake_id
      @cake_cal = Theft.last.next_cake_cal
      @exact_time_of_previous = Theft.last.exact_time
      @time_left = (Theft.last.time_of_next - @time_now) / 60
    end
    @time_of_next = (rand(15...45) * 60) + @time_now
    @cake_name = Cake.find(@cake_id).name
    @next_cake_id = get_random()
    @next_cake_cal = rand(Cake.find(@next_cake_id).cal_min...Cake.find(@next_cake_id).cal_max)
  end

  private

  def theft_params
    params.require(:theft).permit(:user_id, :cake_id, :cake_cal, :time_of_next, :next_cake_id, :next_cake_cal, :exact_time, :exact_time_of_previous)
  end

  def get_random
    case rand(100) + 1
    when  1..26 then 1
    when 27..50 then 2
    when 51..70 then 3
    when 71..85 then 4
    when 86..95 then 5
    when 96..100 then 6
    end
  end

end

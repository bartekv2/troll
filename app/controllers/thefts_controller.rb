class TheftsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    params[:theft][:time_of_next] = (rand(1...2) * 60) + Time.now.to_i

    @theft = Theft.new(theft_params)
    if answer_correct?
      if @theft.save
        flash[:good_news] = "Congratulations! You've trolled the troll!"
      else
        flash[:bad_news] = "Unfortunately somebody was faster."
      end
    else
      flash[:bad_news] = "Wrong answer."
    end
    redirect_to thefts_path

  end

  def index
    @first_number = rand(1..10)
    @second_number = rand(1..10)
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
    @time_of_next = (rand(1...2) * 60) + @time_now
    unless @thefts.empty?
      @last_thief = @thefts.first.user.username
      @cake_id = Theft.last.next_cake_id
      @cake_cal = Theft.last.next_cake_cal
      @exact_time_of_previous = Theft.last.exact_time
      @time_left = (Theft.last.time_of_next - @time_now)
    end

    @cake_name = Cake.find(@cake_id).name
    @next_cake_id = get_random()
    @next_cake_cal = rand(Cake.find(@next_cake_id).cal_min...Cake.find(@next_cake_id).cal_max) || Cake.find(@next_cake_id).cal_min
  end

  private

  def theft_params
    params.require(:theft).permit(:user_id, :cake_id, :cake_cal, :time_of_next, :next_cake_id, :next_cake_cal, :exact_time, :exact_time_of_previous, :answer, :puzzle_result)
  end

  def get_random
    case rand(100) + 1
    when 1..6 then 1 #7
    when 7..12 then 2 #6
    when 13..18 then 3 #6
    when 19..23 then 4 #5
    when 24..28 then 5 #5
    when 29..33 then 6 #5
    when 34..37 then 7 #5
    when 38..42 then 8 #5
    when 43..47 then 9 #5
    when 48..52 then 10 #5
    when 53..57 then 11 #5
    when 58..62 then 12 #5
    when 63..66 then 13 #4
    when 67..70 then 14 #4
    when 71..74 then 15 #4
    when 75..78 then 16 #4
    when 79..82 then 17 #4
    when 83..86 then 18 #4
    when 87..89 then 19 #3
    when 90..92 then 20 #3
    when 93..95 then 21 #3
    when 96..98 then 22 #3
    when 98..99 then 23 #2
    when 100 then 24 # 1
    end
  end

  def answer_correct?
    params[:theft][:answer] == params[:theft][:puzzle_result]
  end

end

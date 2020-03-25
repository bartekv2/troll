module TheftsHelper
  def is_cookie?
    @time_left < 1
  end

  def get_cake_name(id)
    Cake.find(id).name
  end
end

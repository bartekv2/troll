module TheftsHelper
  def is_cookie?
    @time_left < 1
  end

  def get_cake_name(id)
    Cake.find(id).name
  end

  def log_in_to_play
    simple_format("#{active_link_to('Log in', new_user_session_path)} or #{(active_link_to "Create Account", new_user_registration_path)} to play!", class: 'mt-2')
  end

  def get_troll
    image_tag "troll.png", style: 'height:455px; width:640px;', class: "lg:mr-16 border-2 border-white"
  end

  def get_table
    image_tag "table.gif", style: 'height:193px; width:246px;'
  end

end

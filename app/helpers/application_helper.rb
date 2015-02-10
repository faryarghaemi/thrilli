module ApplicationHelper
    def nav_menu
    links = "<li>#{ link_to('Home', root_path) }</li>"

    if @current_user.present?

      if @current_user.is_admin?
        links += "<li>#{ link_to('All users', users_path)}</li>"
      end 
      
      links += "<li>#{ link_to('Sign Out ' + @current_user.first_name, login_path, :method => :delete) }</li><li>#{ link_to('Create Adventure', new_adventure_path) }</li><li>#{ link_to('Edit Your Profile', edit_user_path(@current_user)) }</li><li>#{ link_to('My Adventures', adventures_mine_path(@current_user)) }</li><li>#{ link_to('Bookings', bookings_path) }</li>"
    else
      links += "<li>#{ link_to('Sign Up', new_user_path) }</li>
    <li>#{ link_to('Log in', login_path) }</li><li>#{ link_to('Create Adventure', new_adventure_path) }</li>"
    end
    links
  end 
end

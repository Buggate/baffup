class AccessController < ApplicationController


  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]

  def menu
    # display text & links
    @username = session[:username]
    @operator = Operator.find_by_username(@username)
  end

  def login
    # login form
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_operator = Operator.where(:username => params[:username]).first
      if found_operator
        authorized_operator = found_operator.authenticate(params[:password])
      end
    end

    if authorized_operator
      session[:operator_id] = authorized_operator.id
      session[:username] = authorized_operator.username
      flash[:notice] = "You are now logged in."
      redirect_to(staff_path)
    else
      flash.now[:notice] = "Invalid username/password combination."
      render('login')
    end

  end

  def logout
    session[:operator_id] = nil
    session[:username] = nil
    flash[:notice] = 'Logged out'
    redirect_to(access_login_path)
  end

end

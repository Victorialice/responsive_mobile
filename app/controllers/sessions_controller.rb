# coding: utf-8
class SessionsController < ApplicationController

  skip_before_action :verify_authenticity_token
  
  def login_async
    user = HUser.find_by(email: params[:email])
    if user.present? && user.valid_password?(params[:password])
      
      encrypted = Base64.encode64("#{user.user_id},#{user.name}")
      cookies[:user] = {
        value: encrypted,
	      expires: 1.day.from_now,
	      path: '/userscenter/'
      }

      session[:user_id] = user.id
      session[:user_name] = user.name
        render json: {code: 200, user_name: user.name}
    else
      render json: {code: 404, mmessage: "error"}
    end
  end

  def logout_async
    session[:user_id] = nil
    session[:user_name] = nil
    render json: {code: 200}
  end

  def new
  end

  def create
    user = HUser.find_by(email: params[:email])
    if user.present? && user.valid_password?(params[:password])
      session[:user_id] = user.id
      session[:user_name] = user.name
      redirect_to "/demo/"
    else
      redirect_to "/demo/"
    end    
  end

  def destroy
    session[:user_id] = nil
    session[:user_name] = nil
    redirect_to "/demo/"
  end
  
end

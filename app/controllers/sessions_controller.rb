# frozen_string_literal: true

class SessionsController < ApplicationController
  include CurrentUserConcern
  def create
    user = User.find_by(email: params['user']['email'])

    if user&.authenticate(params['user']['password'])
      session[:user_id] = user.id
      render json: {
        status: :created,
        logged_in: true,
        user: user
      }
    else
      render json: { status: 401 }
    end
  end

  def logged_in
    if @current_user
      render json: {
        logged_in: true,
        user: user
      }
    end
  end

  def logout; end
end

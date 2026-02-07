class AuthenticationController < ApplicationController
  # POST /auth/login
  def login
    @user = User.find_by(email: params[:email])

    if @user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 24.hours.to_i

      render json: { 
        token: token, 
        exp: time.strftime("%m-%d-%Y %H:%M"),
        user: { id: @user.id, email: @user.email }
      }, status: :ok
    else
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end

  # POST /auth/register
  def register
    @user = User.new(user_params)

    if @user.save
      token = JsonWebToken.encode(user_id: @user.id)
      render json: { token: token, user: { id: @user.id, email: @user.email } }, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
class Api::V1::AuthController < ApplicationController
  def register
    user = User.new(user_params)

    if user.save
      token = JsonWebToken.encode(user_id: user.id)
      render json: { 
        status: 'success', 
        message: 'User created successfully',
        user: { id: user.id, email: user.email, name: user.name },
        token: token 
      }, status: :created
    else
      render json: { 
        status: 'error', 
        errors: user.errors.full_messages 
      }, status: :unprocessable_entity
    end
  end

  def login
    user = User.find_by(email: params[:email])

    if user && user.valid_password?(params[:password])
      token = JsonWebToken.encode(user_id: user.id)
      render json: { 
        status: 'success',
        user: { id: user.id, email: user.email, name: user.name },
        token: token 
      }
    else
      render json: { 
        status: 'error', 
        message: 'Invalid email or password' 
      }, status: :unauthorized
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
class Api::V1::OrganizationMembersController < ApplicationController
  before_action :authenticate_user!

  def create
    @organization = Organization.find(params[:organization_id])

    # Check if current user is owner or admin
    unless @organization.owner == current_user
      render json: { error: "Unauthorized" }, status: :unauthorized
      return
    end

    user = User.find_by(email: params[:email])

    if user
      member = @organization.organization_members.find_or_create_by(user: user) do |m|
        m.role = params[:role] || "member"
      end
      render json: { message: "User added to organization", member: member }, status: :created
    else
      render json: { error: "User not found" }, status: :not_found
    end
  end
end

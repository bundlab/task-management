class Api::V1::OrganizationsController < ApplicationController
  before_action :authenticate_user!  # This will come from JWT later

  def index
    @organizations = current_user.organizations
    render json: @organizations
  end

  def create
    @organization = Organization.new(organization_params)
    @organization.owner = current_user

    if @organization.save
      # Add owner as member
      @organization.organization_members.create(user: current_user, role: :owner)
      render json: @organization, status: :created
    else
      render json: { errors: @organization.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def organization_params
    params.require(:organization).permit(:name)
  end
end

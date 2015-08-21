class UserRolesController < ApplicationController
  def index
    @user_roles = UserRole.all
  end

  def show
    @user_role = UserRole.find(params[:id])
  end

  def new
    @user_role = UserRole.new
  end

  def create
    @user_role = UserRole.new

    @user_role.role_description = params[:role_description]

    @user_role.role_name = params[:role_name]



    if @user_role.save
      redirect_to "/user_roles", :notice => "User role created successfully."
    else
      render 'new'
    end

  end

  def edit
    @user_role = UserRole.find(params[:id])
  end

  def update
    @user_role = UserRole.find(params[:id])


    @user_role.role_description = params[:role_description]

    @user_role.role_name = params[:role_name]



    if @user_role.save
      redirect_to "/user_roles", :notice => "User role updated successfully."
    else
      render 'edit'
    end

  end

  def destroy
    @user_role = UserRole.find(params[:id])

    @user_role.destroy


    redirect_to "/user_roles", :notice => "User role deleted."

  end
end

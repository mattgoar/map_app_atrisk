class ImplStatusesController < ApplicationController
  def index
    @impl_statuses = ImplStatus.all.order(:status_name )
  end

  def show
    @impl_status = ImplStatus.find(params[:id])
  end

  def new
    @impl_status = ImplStatus.new
  end

  def create
    @impl_status = ImplStatus.new

    @impl_status.active = params[:active]

    @impl_status.last_edited_by = params[:last_edited_by]

    @impl_status.status_name = params[:status_name]



    if @impl_status.save
      redirect_to "/impl_statuses", :notice => "Implementation step created successfully."
    else
      render 'new'
    end

  end

  def edit
    @impl_status = ImplStatus.find(params[:id])
  end

  def update
    @impl_status = ImplStatus.find(params[:id])


    @impl_status.active = params[:active]

    @impl_status.last_edited_by = params[:last_edited_by]

    @impl_status.status_name = params[:status_name]



    if @impl_status.save
      redirect_to "/impl_statuses", :notice => "Implementation step updated successfully."
    else
      render 'edit'
    end

  end

  def activate
    @impl_status = ImplStatus.find(params[:id])
    @impl_status.active = "true"
    @impl_status.last_edited_by = current_user.id
    @impl_status.save



    redirect_to "/impl_statuses", :notice => "Step activated."

  end

   def deactivate
    @impl_status = ImplStatus.find(params[:id])
    @impl_status.active = "false"
    @impl_status.last_edited_by = current_user.id
    @impl_status.save

    redirect_to "/impl_statuses", :notice => "Step deactivated."

  end

end

class ImplStatusesController < ApplicationController
  def index
    @impl_statuses = ImplStatus.all
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
      redirect_to "/impl_statuses", :notice => "Impl status created successfully."
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
      redirect_to "/impl_statuses", :notice => "Impl status updated successfully."
    else
      render 'edit'
    end

  end

  def destroy
    @impl_status = ImplStatus.find(params[:id])

    @impl_status.destroy


    redirect_to "/impl_statuses", :notice => "Impl status deleted."

  end
end

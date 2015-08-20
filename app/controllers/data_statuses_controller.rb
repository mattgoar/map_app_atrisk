class DataStatusesController < ApplicationController
  def index
    @data_statuses = DataStatus.all
  end

  def show
    @data_status = DataStatus.find(params[:id])
  end

  def new
    @data_status = DataStatus.new
  end

  def create
    @data_status = DataStatus.new

    @data_status.last_edited_by = params[:last_edited_by]

    @data_status.months_late = params[:months_late]

    @data_status.db_type = params[:db_type]

    @data_status.month = params[:month]

    @data_status.year = params[:year]

    @data_status.client_id = params[:client_id]



    if @data_status.save
      redirect_to "/data_statuses", :notice => "Data status created successfully."
    else
      render 'new'
    end

  end

  def edit
    @data_status = DataStatus.find(params[:id])
  end

  def update
    @data_status = DataStatus.find(params[:id])


    @data_status.last_edited_by = params[:last_edited_by]

    @data_status.months_late = params[:months_late]

    @data_status.db_type = params[:db_type]

    @data_status.month = params[:month]

    @data_status.year = params[:year]

    @data_status.client_id = params[:client_id]



    if @data_status.save
      redirect_to "/data_statuses", :notice => "Data status updated successfully."
    else
      render 'edit'
    end

  end

  def destroy
    @data_status = DataStatus.find(params[:id])

    @data_status.destroy


    redirect_to "/data_statuses", :notice => "Data status deleted."

  end
end

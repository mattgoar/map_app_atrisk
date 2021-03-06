class PaymentStatusesController < ApplicationController
  def index
    @payment_statuses = PaymentStatus.all.order('active DESC, status_name')
  end

  def show
    @payment_status = PaymentStatus.find(params[:id])
  end

  def new
    @payment_status = PaymentStatus.new
  end

  def create
    @payment_status = PaymentStatus.new

    @payment_status.active = params[:active]

    @payment_status.last_edited_by = params[:last_edited_by]

    @payment_status.status_name = params[:status_name]



    if @payment_status.save
      redirect_to "/payment_statuses", :notice => "Payment status created successfully."
    else
      render 'new'
    end

  end

  def edit
    @payment_status = PaymentStatus.find(params[:id])
  end

  def update
    @payment_status = PaymentStatus.find(params[:id])


    @payment_status.active = params[:active]

    @payment_status.last_edited_by = params[:last_edited_by]

    @payment_status.status_name = params[:status_name]



    if @payment_status.save
      redirect_to "/payment_statuses", :notice => "Payment status updated successfully."
    else
      render 'edit'
    end

  end

  def activate
    @payment_status = PaymentStatus.find(params[:id])
    @payment_status.active = true
    @payment_status.last_edited_by = current_user.id
    @payment_status.save

    redirect_to "/payment_statuses", :notice => "Payment status activated."

  end

  def deactivate
    @payment_status = PaymentStatus.find(params[:id])
    @payment_status.active = false
    @payment_status.last_edited_by = current_user.id
    @payment_status.save

    redirect_to "/payment_statuses", :notice => "Payment status deactivated."

  end

end

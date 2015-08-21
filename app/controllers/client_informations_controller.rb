class ClientInformationsController < ApplicationController
  def index
    @client_informations = ClientInformation.all
  end

  def show
    @client_information = ClientInformation.find(params[:id])
  end

  def new
    @client_information = ClientInformation.new
  end

  def create
    @client_information = ClientInformation.new

    @client_information.client_id = params[:client_id]

    @client_information.last_edited_by = params[:last_edited_by]

    @client_information.last_contact_date = params[:last_contact_date]

    @client_information.exec_sponsor = params[:exec_sponsor]

    @client_information.termination_notice = params[:termination_notice]

    @client_information.payment_status_id = params[:payment_status_id]

    @client_information.balance = params[:balance]

    @client_information.reactivation_date = params[:reactivation_date]

    @client_information.expiration_date = params[:expiration_date]

    @client_information.annual_fee = params[:annual_fee]

    @client_information.sales_rep_id = params[:sales_rep_id]

    @client_information.type = params[:type]



    if @client_information.save
      redirect_to "/client_informations", :notice => "Client information created successfully."
    else
      render 'new'
    end

  end

  def edit
    @client_information = ClientInformation.find(params[:id])
  end

  def update
    @client_information = ClientInformation.find(params[:id])


    @client_information.client_id = params[:client_id]

    @client_information.last_edited_by = params[:last_edited_by]

    @client_information.last_contact_date = params[:last_contact_date]

    @client_information.exec_sponsor = params[:exec_sponsor]

    @client_information.termination_notice = params[:termination_notice]

    @client_information.payment_status_id = params[:payment_status_id]

    @client_information.balance = params[:balance]

    @client_information.reactivation_date = params[:reactivation_date]

    @client_information.expiration_date = params[:expiration_date]

    @client_information.annual_fee = params[:annual_fee]

    @client_information.sales_rep_id = params[:sales_rep_id]

    @client_information.type = params[:type]



    if @client_information.save
      redirect_to "/client_informations", :notice => "Client information updated successfully."
    else
      render 'edit'
    end

  end

  def destroy
    @client_information = ClientInformation.find(params[:id])

    @client_information.destroy


    redirect_to "/client_informations", :notice => "Client information deleted."

  end
end

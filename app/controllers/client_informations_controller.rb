class ClientInformationsController < ApplicationController
  def index
    # @client_informations = ClientInformation.all
    @client_informations = Client.where(active: true).order('clientname')
  end

  def show
    @client_information = Client.where(id: params[:id])
    @latest_client_information = Client.where(id: params[:id]).order('updated_at DESC').first
  end

  def show_contract
    @latest_client_information = ClientInformation.where(client_id: params[:id]).order('updated_at DESC').first
    @client_information = ClientInformation.order('updated_at DESC').where(client_id: params[:id]).all[1..-1]

    render 'show_contract.html.erb'
  end

  def show_payment
    @latest_client_information = ClientInformation.where(client_id: params[:id]).order('updated_at DESC').first
    @client_information = ClientInformation.order('updated_at DESC').where(client_id: params[:id]).all[1..-1]

    render 'show_payment.html.erb'
  end

  def new_contract
    @client_information = ClientInformation.new
    @latest_client_information = ClientInformation.where(client_id: params[:id]).order('updated_at DESC').first
    render 'new_contract.html.erb'
  end

  def new_payment
    @client_information = ClientInformation.new
    @latest_client_information = ClientInformation.where(client_id: params[:id]).order('updated_at DESC').first
    render 'new_payment.html.erb'
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
    @client_information.contract_type = params[:contract_type]

    if @client_information.save
      redirect_to :back, :notice => "Client information created successfully."
    else
      render 'new'
    end
  end

#  def new
#    @client_information = ClientInformation.new
#  end

 # def edit
  #   @client_information = ClientInformation.find(params[:id])
  # end

  # def update
  #   @client_information = ClientInformation.find(params[:id])
  #   @client_information.client_id = params[:client_id]
  #   @client_information.last_edited_by = params[:last_edited_by]
  #   @client_information.last_contact_date = params[:last_contact_date]
  #   @client_information.exec_sponsor = params[:exec_sponsor]
  #   @client_information.termination_notice = params[:termination_notice]
  #   @client_information.payment_status_id = params[:payment_status_id]
  #   @client_information.balance = params[:balance]
  #   @client_information.reactivation_date = params[:reactivation_date]
  #   @client_information.expiration_date = params[:expiration_date]
  #   @client_information.annual_fee = params[:annual_fee]
  #   @client_information.sales_rep_id = params[:sales_rep_id]
  #   @client_information.contract_type = params[:contract_type]
  #   if @client_information.save
  #     redirect_to "/client_informations", :notice => "Client information updated successfully."
  #   else
  #     render 'edit'
  #   end
  # end

  # def destroy
  #   @client_information = ClientInformation.find(params[:id])
  #   @client_information.destroy
  #   redirect_to "/client_informations", :notice => "Client information deleted."
  # end
end

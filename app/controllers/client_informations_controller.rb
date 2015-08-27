class ClientInformationsController < ApplicationController
  def index
    # @client_informations = ClientInformation.all
    @client_informations = Client.where(active: true).order('clientname')
  end

  def index_summary
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

  def show_contact
    @latest_client_information = ClientInformation.where(client_id: params[:id]).order('updated_at DESC').first
    @client_information = ClientInformation.order('updated_at DESC').where(client_id: params[:id]).all[1..-1]

    render 'show_contact.html.erb'
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

  def new_contact
    @client_information = ClientInformation.new
    @latest_client_information = ClientInformation.where(client_id: params[:id]).order('updated_at DESC').first
    render 'new_contact.html.erb'
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
      update_atrisk(@client_information)
      redirect_to :back, :notice => "Client information created successfully."
    else
      render 'new'
    end
  end

  def update_atrisk(client_information)
    atrisk_update = Atrisk.new
    atrisk_update.client_id = client_information.client_id
    atrisk_update.exec_sponsor_status = if client_information.exec_sponsor != 'None' then 'Good Standing' else 'At-Risk' end
    days_since_contact = (Date.today - client_information.last_contact_date).to_i
    atrisk_update.last_contact_status = if days_since_contact >= 180 then 'At-Risk' elsif days_since_contact >= 90 then 'Watch' else 'Good Standing' end
    #
    # This is not a good way to do this
    # Fix me later
    #
    atrisk_update.payment_status =
      if client_information.payment_status.status_name == '' then 'At-Risk'
      elsif client_information.payment_status.status_name == '' then 'Watch'
      else 'Good Standing'
      end

    atrisk_update.implementation_status =  client_information.atrisk.implementation_status
    atrisk_update.data_status = client_information.atrisk.data_status

    current_status = "NA"
    current_reason = "NA"

    puts '#'*80
    puts days_since_contact
    puts atrisk_update.last_contact_status

    atrisk_update.save

    latest_atrisk_information = Atrisk.where(client_id: client_information.client_id).order('updated_at DESC').first

    at_risk_reasons = latest_atrisk_information.attributes.select { |k,v| v == "At-Risk"}.keys.join(", ").gsub('_',' ').gsub(' status','').titleize
    watch_reasons = latest_atrisk_information.attributes.select { |k,v| v == "Watch"}.keys.join(", ").gsub('_',' ').gsub(' status','').titleize

    if at_risk_reasons.length > 0 then
      latest_atrisk_information.current_status = '1. At-Risk'
      latest_atrisk_information.current_reason = at_risk_reasons
    elsif watch_reasons.length > 0 then
      latest_atrisk_information.current_status = '2. Watch'
      latest_atrisk_information.current_reason = watch_reasons
    else
      latest_atrisk_information.current_status = '3. Good Standing'
      latest_atrisk_information.current_reason = ''
    end
    latest_atrisk_information.save

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

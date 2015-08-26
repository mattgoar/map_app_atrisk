class ClientsController < ApplicationController
  def index
    @clients = Client.all.order('active DESC, clientname')
  end

  def show
    @client = Client.find(params[:id])
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new

    @client.active = params[:active]

    @client.last_edited_by = params[:last_edited_by]

    @client.clientname = params[:clientname]

    if @client.save
      redirect_to "/clients", :notice => "Client created successfully."

      ClientInformation.create!([{client_id: @client.id, last_edited_by: current_user.id, last_contact_date: "1900-01-01", exec_sponsor: "None", termination_notice: "1900-01-01", payment_status_id: 1, balance: 0, reactivation_date: "1900-01-01", expiration_date: "1900-01-01", annual_fee: 0, sales_rep_id: 1, contract_type: "None"}])

      ClientOnboardingStatus.create!([{last_edited_by: current_user.id, notes: "None", impl_status_id: 1, certification_date: "1900-01-01", kickoff_date: "1900-01-01", client_id: @client.id}])

      DataStatus.create!([{last_edited_by: current_user.id, months_late: 0, db_type: 'None', month: 0, year: 0, client_id: @client.id}])

    else
      render 'new'
    end

  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])


    @client.active = params[:active]

    @client.last_edited_by = params[:last_edited_by]

    @client.clientname = params[:clientname]



    if @client.save
      redirect_to "/clients", :notice => "Client updated successfully."
    else
      render 'edit'
    end

  end

  def activate
    @client = Client.find(params[:id])
    @client.active = true
    @client.last_edited_by  = current_user.id
    @client.save

    redirect_to "/clients", :notice => "Client activated."

  end

 def deactivate
    @client = Client.find(params[:id])
    @client.active = false
    @client.last_edited_by  = current_user.id
    @client.save

    redirect_to "/clients", :notice => "Client deactivated."

  end

end

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

      Client.create_assoc_data(@client.id, current_user.id)

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

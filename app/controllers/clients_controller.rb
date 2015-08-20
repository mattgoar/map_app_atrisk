class ClientsController < ApplicationController
  def index
    @clients = Client.all
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

  def destroy
    @client = Client.find(params[:id])

    @client.destroy


    redirect_to "/clients", :notice => "Client deleted."

  end
end

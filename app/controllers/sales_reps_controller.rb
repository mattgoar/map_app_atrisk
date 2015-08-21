class SalesRepsController < ApplicationController
  def index
    @sales_reps = SalesRep.all
  end

  def show
    @sales_rep = SalesRep.find(params[:id])
  end

  def new
    @sales_rep = SalesRep.new
  end

  def create
    @sales_rep = SalesRep.new

    @sales_rep.active = params[:active]

    @sales_rep.last_edited_by = params[:last_edited_by]

    @sales_rep.name = params[:name]



    if @sales_rep.save
      redirect_to "/sales_reps", :notice => "Sales rep created successfully."
    else
      render 'new'
    end

  end

  def edit
    @sales_rep = SalesRep.find(params[:id])
  end

  def update
    @sales_rep = SalesRep.find(params[:id])


    @sales_rep.active = params[:active]

    @sales_rep.last_edited_by = params[:last_edited_by]

    @sales_rep.name = params[:name]



    if @sales_rep.save
      redirect_to "/sales_reps", :notice => "Sales rep updated successfully."
    else
      render 'edit'
    end

  end

  def deactivate
    @sales_rep = SalesRep.find(params[:id])

    @sales_rep.active = "false"

    @sales_rep.save


    redirect_to "/sales_reps", :notice => "Sales rep inactivated."

  end

  def activate
    @sales_rep = SalesRep.find(params[:id])

    @sales_rep.active = "true"

    @sales_rep.save


    redirect_to "/sales_reps", :notice => "Sales rep activated."

  end
end

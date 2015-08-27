class ClientOnboardingStatusesController < ApplicationController
  def index
    @client_onboarding_statuses = ClientOnboardingStatus.all
  end

  def show
    @latest_onboarding_status = ClientOnboardingStatus.where(client_id: params[:id]).order('updated_at DESC').first
    @client_onboarding_status = ClientOnboardingStatus.order('updated_at DESC').where(client_id: params[:id]).all[1..-1]
  end

  def new
    @client_onboarding_status = ClientOnboardingStatus.new
    @latest_onboarding_status = ClientOnboardingStatus.where(client_id: params[:id]).order('updated_at DESC').first
  end

  def create
    @client_onboarding_status = ClientOnboardingStatus.new

    @client_onboarding_status.last_edited_by = params[:last_edited_by]

    @client_onboarding_status.notes = params[:notes]

    @client_onboarding_status.impl_status_id = params[:impl_status_id]

    @client_onboarding_status.certification_date = params[:certification_date]

    @client_onboarding_status.kickoff_date = params[:kickoff_date]

    @client_onboarding_status.client_id = params[:client_id]



    if @client_onboarding_status.save
      update_atrisk(@client_onboarding_status)
      redirect_to :back, :notice => "Client onboarding status created successfully."
    else
      render 'new'
    end
  end

  def update_atrisk(implementation_status)
    atrisk_update = Atrisk.where(client_id: implementation_status.client_id).order('updated_at DESC').first.dup

    #
    # Relevant updates
    #

    impl_days = (Date.today - implementation_status.kickoff_date).to_i
    atrisk_update.implementation_status =
      if implementation_status.impl_status.status_name == '1. Active'
        then
        if impl_days > 150
          then 'At-Risk'
          elsif impl_days > 90
            then 'Watch'
          else 'Good Standing'
          end
        else 'Good Standing'
      end

      atrisk_update.save
      Atrisk.update(implementation_status.client_id)

  end


  #def edit
  #   @client_onboarding_status = ClientOnboardingStatus.find(params[:id])
  #end

  # def update
  #   @client_onboarding_status = ClientOnboardingStatus.find(params[:id])


  #   @client_onboarding_status.last_edited_by = params[:last_edited_by]

  #   @client_onboarding_status.notes = params[:notes]

  #   @client_onboarding_status.impl_status_id = params[:impl_status_id]

  #   @client_onboarding_status.certification_date = params[:certification_date]

  #   @client_onboarding_status.kickoff_date = params[:kickoff_date]

  #   @client_onboarding_status.client_id = params[:client_id]



  #   if @client_onboarding_status.save
  #     redirect_to :back, :notice => "Client onboarding status created successfully."
  #   else
  #     render 'edit'
  #   end

  # end

  # def destroy
  #   @client_onboarding_status = ClientOnboardingStatus.find(params[:id])

  #   @client_onboarding_status.destroy


  #   redirect_to "/client_onboarding_statuses", :notice => "Client onboarding status deleted."

  # end
end

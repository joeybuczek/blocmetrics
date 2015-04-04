class ApplicationsController < ApplicationController
  def index
    @applications = current_user.applications.all
  end

  def show
    @application = get_application
  end

  def new
    @application = Application.new
  end
  
  def create
    @application = current_user.applications.build(application_params)
    if does_not_yet_exist
      @application.save
      redirect_to applications_path
    else
      flash[:error] = "That application is already registered. Please choose another."
      render :new
    end
  end

  def edit
    @application = get_application
  end
  
  def update
    @application = get_application
    @application.update_attributes(application_params)
    redirect_to applications_path
  end
  
  def destroy
    @application = get_application
    @application.destroy
    redirect_to applications_path
  end
  
  private
  
  def get_application
    Application.find(params[:id])
  end
  
  def application_params
    params.require(:application).permit(:name, :url)
  end
  
  def does_not_yet_exist
    Application.where( url: @application.url ).blank?
  end
  
end

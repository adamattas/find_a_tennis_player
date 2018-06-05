class HomeCourtsController < ApplicationController
  def index
    @home_courts = HomeCourt.page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@home_courts.where.not(:location_latitude => nil)) do |home_court, marker|
      marker.lat home_court.location_latitude
      marker.lng home_court.location_longitude
      marker.infowindow "<h5><a href='/home_courts/#{home_court.id}'>#{home_court.teams_id}</a></h5><small>#{home_court.location_formatted_address}</small>"
    end

    render("home_courts/index.html.erb")
  end

  def show
    @home_court = HomeCourt.find(params[:id])

    render("home_courts/show.html.erb")
  end

  def new
    @home_court = HomeCourt.new

    render("home_courts/new.html.erb")
  end

  def create
    @home_court = HomeCourt.new

    @home_court.teams_id = params[:teams_id]
    @home_court.location = params[:location]

    save_status = @home_court.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/home_courts/new", "/create_home_court"
        redirect_to("/home_courts")
      else
        redirect_back(:fallback_location => "/", :notice => "Home court created successfully.")
      end
    else
      render("home_courts/new.html.erb")
    end
  end

  def edit
    @home_court = HomeCourt.find(params[:id])

    render("home_courts/edit.html.erb")
  end

  def update
    @home_court = HomeCourt.find(params[:id])

    @home_court.teams_id = params[:teams_id]
    @home_court.location = params[:location]

    save_status = @home_court.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/home_courts/#{@home_court.id}/edit", "/update_home_court"
        redirect_to("/home_courts/#{@home_court.id}", :notice => "Home court updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Home court updated successfully.")
      end
    else
      render("home_courts/edit.html.erb")
    end
  end

  def destroy
    @home_court = HomeCourt.find(params[:id])

    @home_court.destroy

    if URI(request.referer).path == "/home_courts/#{@home_court.id}"
      redirect_to("/", :notice => "Home court deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Home court deleted.")
    end
  end
end

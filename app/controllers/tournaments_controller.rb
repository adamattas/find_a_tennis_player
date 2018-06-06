class TournamentsController < ApplicationController
  def index
    @q = Tournament.ransack(params[:q])
    @tournaments = @q.result(:distinct => true).includes(:teams).page(params[:page]).per(10)

    render("tournaments/index.html.erb")
  end

  def show
    @team = Team.new
    @tournament = Tournament.find(params[:id])

    render("tournaments/show.html.erb")
  end

  def new
    @tournament = Tournament.new

    render("tournaments/new.html.erb")
  end

  def create
    @tournament = Tournament.new


    save_status = @tournament.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/tournaments/new", "/create_tournament"
        redirect_to("/tournaments")
      else
        redirect_back(:fallback_location => "/", :notice => "Tournament created successfully.")
      end
    else
      render("tournaments/new.html.erb")
    end
  end

  def edit
    @tournament = Tournament.find(params[:id])

    render("tournaments/edit.html.erb")
  end

  def update
    @tournament = Tournament.find(params[:id])


    save_status = @tournament.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/tournaments/#{@tournament.id}/edit", "/update_tournament"
        redirect_to("/tournaments/#{@tournament.id}", :notice => "Tournament updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Tournament updated successfully.")
      end
    else
      render("tournaments/edit.html.erb")
    end
  end

  def destroy
    @tournament = Tournament.find(params[:id])

    @tournament.destroy

    if URI(request.referer).path == "/tournaments/#{@tournament.id}"
      redirect_to("/", :notice => "Tournament deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Tournament deleted.")
    end
  end
end

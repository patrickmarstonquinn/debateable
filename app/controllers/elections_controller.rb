class ElectionsController < ApplicationController
  def index
    @q = Election.ransack(params[:q])
    @elections = @q.result(:distinct => true).page(params[:page]).per(10)


    url = "https://www.googleapis.com/civicinfo/v2/elections?key=AIzaSyAD7xaBeiFVkhadoR87jbvSgJ0YuIAWBD4"

    # instert election index

    render("elections/index.html.erb")
  end

  def show
    @election = Election.find(params[:id])

    render("elections/show.html.erb")
  end

  def new
    @election = Election.new

    render("elections/new.html.erb")
  end

  def create
    @election = Election.new


    save_status = @election.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/elections/new", "/create_election"
        redirect_to("/elections")
      else
        redirect_back(:fallback_location => "/", :notice => "Election created successfully.")
      end
    else
      render("elections/new.html.erb")
    end
  end

  def edit
    @election = Election.find(params[:id])

    render("elections/edit.html.erb")
  end

  def update
    @election = Election.find(params[:id])


    save_status = @election.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/elections/#{@election.id}/edit", "/update_election"
        redirect_to("/elections/#{@election.id}", :notice => "Election updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Election updated successfully.")
      end
    else
      render("elections/edit.html.erb")
    end
  end

  def destroy
    @election = Election.find(params[:id])

    @election.destroy

    if URI(request.referer).path == "/elections/#{@election.id}"
      redirect_to("/", :notice => "Election deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Election deleted.")
    end
  end

  def mine

  end
end

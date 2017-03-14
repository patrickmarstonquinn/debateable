class DebatesController < ApplicationController
  before_action :current_user_must_be_debate_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_debate_user
    debate = Debate.find(params[:id])

    unless current_user == debate.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @debates = Debate.all

    render("debates/index.html.erb")
  end

  def show
    @debate = Debate.find(params[:id])

    render("debates/show.html.erb")
  end

  def new
    @debate = Debate.new

    render("debates/new.html.erb")
  end

  def create
    @debate = Debate.new

    @debate.liburl = params[:liburl]
    @debate.libtitle = params[:libtitle]
    @debate.conurl = params[:conurl]
    @debate.contitle = params[:contitle]
    @debate.user_id = params[:user_id]
    @debate.topic = params[:topic]
    @debate.electionid = params[:electionid]

    save_status = @debate.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/debates/new", "/create_debate"
        redirect_to("/debates")
      else
        redirect_back(:fallback_location => "/", :notice => "Debate created successfully.")
      end
    else
      render("debates/new.html.erb")
    end
  end

  def edit
    @debate = Debate.find(params[:id])

    render("debates/edit.html.erb")
  end

  def update
    @debate = Debate.find(params[:id])

    @debate.liburl = params[:liburl]
    @debate.libtitle = params[:libtitle]
    @debate.conurl = params[:conurl]
    @debate.contitle = params[:contitle]
    @debate.user_id = params[:user_id]
    @debate.topic = params[:topic]
    @debate.electionid = params[:electionid]

    save_status = @debate.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/debates/#{@debate.id}/edit", "/update_debate"
        redirect_to("/debates/#{@debate.id}", :notice => "Debate updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Debate updated successfully.")
      end
    else
      render("debates/edit.html.erb")
    end
  end

  def destroy
    @debate = Debate.find(params[:id])

    @debate.destroy

    if URI(request.referer).path == "/debates/#{@debate.id}"
      redirect_to("/", :notice => "Debate deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Debate deleted.")
    end
  end
end

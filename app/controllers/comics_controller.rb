class ComicsController < ApplicationController
  def index
    @q = Comic.ransack(params[:q])
    @comics = @q.result(:distinct => true).includes(:media).page(params[:page]).per(10)

    render("comics/index.html.erb")
  end

  def show
    @medium = Medium.new
    @comic = Comic.find(params[:id])

    render("comics/show.html.erb")
  end

  def new
    @comic = Comic.new

    render("comics/new.html.erb")
  end

  def create
    @comic = Comic.new

    @comic.name = params[:name]
    @comic.comic_url = params[:comic_url]

    save_status = @comic.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/comics/new", "/create_comic"
        redirect_to("/comics")
      else
        redirect_back(:fallback_location => "/", :notice => "Comic created successfully.")
      end
    else
      render("comics/new.html.erb")
    end
  end

  def edit
    @comic = Comic.find(params[:id])

    render("comics/edit.html.erb")
  end

  def update
    @comic = Comic.find(params[:id])

    @comic.name = params[:name]
    @comic.comic_url = params[:comic_url]

    save_status = @comic.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/comics/#{@comic.id}/edit", "/update_comic"
        redirect_to("/comics/#{@comic.id}", :notice => "Comic updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Comic updated successfully.")
      end
    else
      render("comics/edit.html.erb")
    end
  end

  def destroy
    @comic = Comic.find(params[:id])

    @comic.destroy

    if URI(request.referer).path == "/comics/#{@comic.id}"
      redirect_to("/", :notice => "Comic deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Comic deleted.")
    end
  end
end

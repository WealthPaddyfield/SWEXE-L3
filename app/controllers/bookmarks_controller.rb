class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
    @bookmark = Bookmark.new
  end
  def new
    @bookmark = Bookmark.new  #formヘルパーのデータの入れ物になる
  end
  def create
  @bookmark = Bookmark.new(title: params[:bookmark][:title], url: params[:bookmark][:url],note: params[:bookmark][:note])
  if @bookmark.save
    redirect_to bookmarks_path
  else
    render :new, status: :unprocessable_entity
  end
  end
  def destroy
    bookmark = Bookmark.find(params[:id])
    bookmark.destroy
    redirect_to root_path
  end
  def show
    @bookmark = Bookmark.find(params[:id])
  end
  def edit
    @bookmark = Bookmark.find(params[:id])
  end
  def update
  bookmark = Bookmark.find(params[:id])
  bookmark.update(title: params[:bookmark][:title], url: params[:bookmark][:url],note: params[:bookmark][:note])
  redirect_to root_path
  end
end

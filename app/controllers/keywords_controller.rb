class KeywordsController < ApplicationController
before_action :authenticate_client!
  def new
    @keyword = Keyword.new
  end

  def index
    @keyword = Keyword.all
  end

  def create
    @keyword = Keyword.new(keyword_params)
    if @keyword.save
      flash[:success] = "created. Ok"
      redirect_to keywords_path
    else
      flash[:error] = "Houston we are in troubles, try it again."
      render 'new'
    end
  end

  def edit
    find_keyword
    if @keyword.nil?
      flash[:error] = "Houston we are in troubles, please dont hack us."
      redirect_to keywords_path
    end
  end

  def update
    find_keyword
    if @keyword.update(keyword_params)
      flash[:success] = "updated. Ok"
      redirect_to keywords_path
    else
      flash[:error] = "Houston we are in troubles, try it again."
      render 'edit'
    end
  end

  def destroy
    find_keyword
    if @keyword.destroy
      flash[:success] = "Destroyed Successfully"
    else
      flash[:error] = "Houston we are in troubles, please try it later"
    end
    redirect_to keywords_path
  end

  def show
    find_keyword
    if @keyword.nil?
      flash[:error] = "Houston we are in troubles, please dont hack us."
      redirect_to keywords_path
    end
  end

  private

  def find_keyword
    @keyword = Keyword.find_by(id: params[:id])
  end

  def keyword_params
    params.require(:keyword).permit(:name)
  end

end

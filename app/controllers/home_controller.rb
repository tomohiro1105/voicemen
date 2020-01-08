class HomeController < ApplicationController
  before_action :move_to_sign_in

  def index
  end

  def new
    @word = Word.new
  end

  def create
    @word = Word.create(home_params)
    if @word.save
      redirect_to :root, notice: 'ワード登録が完了しました'
    else
      redirect_to :new_home
    end
  end

  def edit 
    @word = Word.find(params[:id])
  end

  def update
    @word = Word.find(params[:id])
    @word.update(home_params)
    if @word.save
      redirect_to :root, notice: 'ワード登録が完了しました'
    else
      redirect_to :edit_home
    end
  end

  def destroy
    @word = Word.find(params[:id])
    @word.destroy
    redirect_to :word_register_home_index
  end

  def word_register
    @words = Word.all
  end

  private
  def home_params
    params.require(:word).permit(:keyword, :content_url)
  end

  def move_to_sign_in
    redirect_to :new_user_registration unless user_signed_in?
  end
end

class HomeController < ApplicationController
  before_action :move_to_sign_in
  before_action :set_word, only: [:edit, :update, :destroy]
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
   
  end

  def update 
    @word.update(home_params)
    if @word.save
      redirect_to :root, notice: 'ワード登録が完了しました'
    else
      redirect_to :edit_home
    end
  end

  def destroy
    @word.destroy
    redirect_to :word_register_home_index
  end

  def word_register
    user_id = current_user.id
    @words = Word.where(user_id: user_id).includes(:user)
  end

  private
  def home_params
    params.require(:word).permit(:keyword, :content_url).merge(user_id: current_user.id)
  end

  def move_to_sign_in
    redirect_to :new_user_registration unless user_signed_in?
  end

  def set_word
    @word = Word.find(params[:id])
  end
end

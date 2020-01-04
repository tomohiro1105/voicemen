class HomeController < ApplicationController
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

  def word_register
    @words = Word.all
  end

  private
  def home_params
    params.require(:word).permit(:keyword, :content_url)
  end
end

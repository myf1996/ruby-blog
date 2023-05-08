# require "#{Rails.root}/app/dtos/email.dto.rb"

class ArticlesController < ApplicationController
  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
  # before_action :check_file_size, only: [:create, :update]

  def index
    # email_dto = EmailDto.new(
    #   to: 'yassar.testedtalent@gmail.com',
    #   content: 'Hello, this is a test email',
    #   subject: 'Test email',
    #   # attachment: File.read('/path/to/attachment.pdf')
    # )

    # send_email(email_dto)
    @articles = Article.all
  end

  def show
    @article = Article.find_by(id: params[:id])
    raise ExceptionError.new("Article not found", 404) unless @article
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.file.attach(params[:article][:file])
    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      @article.file.attach(params[:article][:file])
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def article_params
      puts("article_params",params)
      puts("title",:title)
      puts("body",:body)
      puts("article",:article)
      params.require(:article).permit(:title, :body, :status)
    end

  # private
  #   def check_file_size
  #     if params[:article][:file].size > 5.megabytes
  #       flash[:alert] = "File size exceeds the limit (5 MB)"
  #       redirect_to request.referer || root_path
  #     end
  #   end
end

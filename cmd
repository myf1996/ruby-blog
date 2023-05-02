Article.find(1)
Article.find_by(title: 'Hello Rails')



# @article = Article.find_by(id: params[:id])
# unless @article
#   raise ExceptionError.new("Article not found", 404)
# end
# puts("Hello World")
# puts("Statement 1")
# puts("Statement 2")


# @article = Article.find_by(id: params[:id])
# unless @article
#   # execute statement 1
#   # execute statement 2
#   raise ExceptionError.new("Article not found", 404)
# end

# ruby bin/rails generate model Article title:string body:text
# ruby bin/rails generate model Comment commenter:string body:text article:references
# ruby bin/rails db:migrate

# ruby bin/rails generate controller Comments


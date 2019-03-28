class Api::V1::ArticlesController < ApplicationController
	def index
		articles = Article.all
		render json: { articles: articles }
	end

	def show
		article = Article.find(params[:id])
		render json: {title: article.title, category: article.category.name, image: article.image,content: article.content}
	end
end
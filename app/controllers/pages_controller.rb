class PagesController < ApplicationController
  def index
    # Выводим страницу index (расширение не нужно) из папки pages
    # render - метод, который вызывается для отрисовки страницы
    # render - по умолчанию вызывается index.html.erb для render :action => 'index'
    # @username = params[:username]
  end
end

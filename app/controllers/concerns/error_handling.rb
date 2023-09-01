module ErrorHandling
  extend ActiveSupport::Concern

  # добавить всю эту часть в те классы, где этот модуль был подключен 
  included do
    # обрабатывать ошибку "RecordNotFound" в методе notfound
    rescue_from ActiveRecord::RecordNotFound, with: :notfound

    private

    def notfound(exception)
      # записываем в лог rails ошибку
      logger.warn exception
      # layout: false - отдаем файл 404.html без лейаутов
      render file: 'public/404.html', status: :not_found, layout: false
    end
  end
end

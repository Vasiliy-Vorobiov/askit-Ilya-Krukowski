module ApplicationHelper

  def nav_tab(title, url, options = {})
    # сначала найдет значение по ключу, а потом удалит ключ из хэша
    current_page = options.delete :current_page
    css_class = current_page == title ? 'text-secondary' : 'text-white'

    options[:class] = if options[:class].present?
                        options[:class] + ' ' + css_class
                      else
                        css_class
                      end

    link_to title, url, options
  end

  def currently_at(current_page = '')
    render partial: 'shared/menu', locals: { current_page: current_page }
  end

  def full_title(page_title='')
    base_title = 'Ask it'
    if page_title.present?
      "#{page_title} | #{base_title}"
    else
      base_title
    end
  end
end

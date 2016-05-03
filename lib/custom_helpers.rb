module CustomHelpers
  def navigation_pages
    nav_items = sitemap.where(primary_navigation: true).order_by(:weight).all
    nav_items.select { |nav| nav.metadata[:locals][:lang] == I18n.locale }
  end

  def slugify(term)
    term.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def localized_path(path)
    unless development?
      return path
    end

    locale = I18n.locale == :'pt-BR' ? '' : I18n.locale
    "#{locale}/#{path}"
  end
end

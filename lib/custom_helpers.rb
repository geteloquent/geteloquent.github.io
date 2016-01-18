module CustomHelpers
  def navigation_pages
    sitemap.where(primary_navigation: true).order_by(:weight).all
  end

  def slugify(term)
    term.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end
end

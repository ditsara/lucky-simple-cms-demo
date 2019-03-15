class PageQuery < Page::BaseQuery
  def find_by_slug(s)
    slug(s).first
  end
end

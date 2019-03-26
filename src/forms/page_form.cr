class PageForm < Page::BaseForm
  fillable title
  fillable body
  fillable slug
  fillable mimetype
  virtual published : Bool

  needs author : User, on: :create

  def prepare
    author.try { |user| author_id.value = user.id }

    generate_slug
    generate_default_mimetype
    remove_whitespace

    validate_required title
    validate_required slug
  end

  def generate_default_mimetype
    return unless mimetype.value.nil?
    mimetype.value = "text/plain"
  end

  def generate_slug
    return unless slug.value.nil? || slug.value == ""

    title_string = title.value.to_s
    title_string = Random::Secure.hex if title_string.empty?

    s = title_string.downcase
      .gsub(/[^\w\s]/, "") # remove non-word chars
      .gsub(/\s+/, "-")    # replace spaces with dashes
      .tr("_", "-")        # replace underscores with dashes
    slug.value = s
  end

  def remove_whitespace
    title.value = (title.value || "").strip
    slug.value = (slug.value || "").strip
  end

  def set_published_at
    return unless published.value
    published_at.value = Time.now
  end
end

class PageForm < Page::BaseForm
  fillable title
  fillable body
  fillable slug

  needs author : User, on: :create

  def prepare
    author.try { |user| author_id.value = user.id }

    generate_slug
    remove_whitespace

    validate_required title
    validate_required slug
  end

  def generate_slug
    return unless slug.value.nil? || slug.value == ""

    r = Random::Secure.hex
    title_string = title.value || r
    title_string = r if title_string == ""

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
end

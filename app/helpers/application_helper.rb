module ApplicationHelper
  def gravatar_for(photographer, options = { size: 80})
    gravatar_id = Digest::MD5::hexdigest(photographer.email.downcase)
    size = options[:size]
    gravatar_url = "http://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: photographer.pname, class: "gravatar")
  end
end

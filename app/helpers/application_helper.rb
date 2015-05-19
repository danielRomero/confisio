module ApplicationHelper

  def twitter_text(text, hash_tags=[], image_url=nil, link=nil)
    # falta investigar cuanto ocupa una imágen y una URL en twitter
    max_chars = 140
    image_chars_size = 80
    link_chars_size = 20

    max_chars += image_chars_size if image_url
    max_chars += link_chars_size if link
    
    hash_tags = hash_tags.empty? ? '' : "##{hash_tags.join(' #')}"
    possible_text = image_url.to_s + text + link.to_s + hash_tags

    if possible_text.length > 140
      text = "#{text(0..137)}..."
    end
     return image_url.to_s + text + link.to_s + hash_tags
  end

end

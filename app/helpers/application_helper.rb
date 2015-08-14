module ApplicationHelper
  def format_phone_number(phone)
    return "#{phone[0..2]} #{phone[3..4]} #{phone[5..6]} #{phone[7..8]}"
  end

  def strip_html_tags(text)
    require 'nokogiri'
    doc = Nokogiri::HTML(text)
    return doc.xpath("//text()").to_s
  end
end

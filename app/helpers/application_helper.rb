module ApplicationHelper
  def format_phone_number(phone)
    return "#{phone[0..2]} #{phone[3..4]} #{phone[5..6]} #{phone[7..8]}"
  end

  def strip_html_tags(text)
    require 'nokogiri'
    doc = Nokogiri::HTML(text)
    return doc.xpath("//text()").to_s
  end

  def time_to_hour_minute(time)
    return '' unless time
    if time.hour.zero?
      time.strftime "%-M #{I18n.t(:minute, count: time.min)}"
    elsif time.min.zero?
      time.strftime "%-H #{I18n.t(:hour, count: time.hour)}"
    else
      time.strftime "%-H #{I18n.t(:hour, count: time.hour)} y %M #{I18n.t(:minute, count: time.min)}"
    end
  end

  def pretty_price(price)
    if price.value.to_i > 0
      "#{'%.2f' % price.value.round(2)} € / #{price.unit_name.capitalize}"
    else
      'Gratis'
    end
  end
end

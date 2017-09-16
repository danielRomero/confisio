module ApplicationHelper

  def strip_html_tags(text)
    require 'nokogiri'
    doc = Nokogiri::HTML(text)
    return doc.xpath("//text()").to_s
  end

  def home_link_to_sections
    content_tag :h2, class: 'text-center p' do
      sections = Section.ordered.map do |section|
        link_to(section.title, section_path(section.permalink), title: section.title)
      end.join(', ')
      "Clínica de #{sections}".html_safe
    end
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

  def pretty_price_with_units(price)
    return 'Gratis' if free_price?(price)
    "#{'%.2f' % price.value.round(2)} <sup>€</sup> / #{price.unit_name.capitalize}".html_safe
  end

  def pretty_price(price)
    return 'Gratis' if free_price?(price)
    "#{'%.2f' % price.value.round(2)} <sup>€</sup>".html_safe
  end

  def free_price?(price)
    price.value.to_i == 0
  end

  def prices_tab_active?(index, section)
    if @section.present?
      @section.id == section.id
    else
      index.zero?
    end
  end

end

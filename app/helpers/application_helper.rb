module ApplicationHelper
  def format_phone_number(phone)
    return "#{phone[0..2]} #{phone[3..4]} #{phone[5..6]} #{phone[7..8]}"
  end
end

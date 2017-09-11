module FreeCallsHelper
  def class_for_status_table(free_call)
    case free_call.status
    when 'nueva'
      'success'
    when 'pendiente'
      'warning'
    else
      ''
    end
  end
end

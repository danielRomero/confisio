class FreeCallsNotifications < ApplicationMailer

  def new_free_call(free_call)
    @free_call = free_call
    emails = if free_call.section
               free_call.section.users.pluck(:email)
             else
               [Setting.first.email]
             end
    mail(to: emails.join(','), subject: '[Confisio web] Nuevo Contacto para que le llamemos')
  end
end

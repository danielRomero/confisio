class FreeCallsNotificationsMailer < ApplicationMailer

  def new_free_call(free_call)
    @free_call = free_call
    mail to: Settings.email, subject: "[Confisio web][#{free_call.section.title}] Nuevo Contacto para que le llamemos"
  end
end

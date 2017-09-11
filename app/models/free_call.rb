class FreeCall < ApplicationRecord
  belongs_to :section

  enum status: [:nueva, :pendiente, :contactado]

  validates :name, presence: true
  validates :phone, presence: true

  before_create :email_notification

  scope :status_new,       -> { where(status: 0) }
  scope :status_pending,   -> { where(status: 1) }
  scope :status_contacted, -> { where(status: 2) }
  scope :order_by_status,  -> { order(status: :asc) }

  private

  def email_notification
    FreeCallsNotificationsMailer.new_free_call(self).deliver_now
  end
end

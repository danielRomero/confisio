class FreeCall < ActiveRecord::Base
  enum status: [:nueva, :pendiente, :contactado]
  validates :name, presence: true
  validates :phone, presence: true
  belongs_to :section
  before_create :email_notification

  scope :status_new, -> { where(status: 0) }
  scope :status_pending, -> { where(status: 1) }
  scope :status_contacted, -> { where(status: 2) }

  private

  def email_notification
    FreeCallsNotifications.new_free_call(self).deliver_now
  end
end

class Setting < ActiveRecord::Base
  belongs_to :section, touch: true
end

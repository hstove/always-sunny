require 'rails_helper'

RSpec.describe Episode, type: :model do
  it { is_expected.to validate_presence_of(:season) }
  it { is_expected.to validate_presence_of(:number) }
  it { is_expected.to validate_presence_of(:title) }
  # it { is_expected.to validate_presence_of(:day_of_week) }
  # it { is_expected.to validate_presence_of(:hour_of_day) }
  # it { is_expected.to validate_presence_of(:time_of_hour) }
end

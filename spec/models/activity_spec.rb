require 'rails_helper'

RSpec.describe Activity, type: :model do

  it { should belong_to :teacher }
  it { should belong_to :room }

  it { should validate_presence_of :room }
  it { should validate_presence_of :title }
  it { should validate_presence_of :activity_type }
end

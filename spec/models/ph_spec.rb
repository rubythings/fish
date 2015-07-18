require 'rails_helper'

RSpec.describe Ph, type: :model do
  it { expect(subject).to validate_presence_of :value }
end

require 'rails_helper'

RSpec.describe Temp, type: :model do

    it { expect(subject).to validate_presence_of :value }

end

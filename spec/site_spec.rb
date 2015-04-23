require 'rails_helper'

describe Site do
  it { should validate_presence_of(:title) }
end

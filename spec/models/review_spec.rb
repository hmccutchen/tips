require "rails_helper"

describe Review, type: :model do
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:rating) }
    it { should validate_presence_of(:clientele) }
    it { should validate_presence_of(:management) }
    it { should validate_presence_of(:role) }


  end
end

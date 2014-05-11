require 'spec_helper'

describe Todo do
  context "for three sample todos in a list" do
    let!(:user) { create(:user) }    
    let!(:todo1) { create(:todo, user: user) }
    let!(:todo2) { create(:todo, user: user) }
    let!(:todo3) { create(:todo, user: user) }        

    it "should reorder other todos if one todo priority is set" do
      expect {
        todo2.priority = 1
        todo2.save!
      }.to change {[todo1, todo2, todo3].map(&:reload).map(&:priority)}.from([3, 2, 1]).to([3, 1, 2])
    end
  end
end

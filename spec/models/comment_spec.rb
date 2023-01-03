require 'rails_helper'

describe Comment do
    it "belongs_to discussion" do
      assc = described_class.reflect_on_association(:discussion)
      expect(assc.macro).to eq :belongs_to
    end
    context "creation of comment " do 
          it " without comment_id " do 
              temp = Comment.create(username:"test", comment:"text text")
              expect(temp).to be_valid
          end 
    end 
end
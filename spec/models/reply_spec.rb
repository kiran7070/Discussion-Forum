require 'rails_helper'

describe Reply do
    it "belongs_to discussion" do
      assc = described_class.reflect_on_association(:comment)
      expect(assc.macro).to eq :belongs_to
    end
    context "creation of reply " do 
          it " without comment_id " do 
              temp = Reply.create(username:"test", reply:"text text")
              expect(temp).to be_valid
          end 
    end 
end
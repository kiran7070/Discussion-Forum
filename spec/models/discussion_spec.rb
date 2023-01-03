require 'rails_helper'


describe Discussion do  
    it "should have many teams" do    
        temp = Discussion.reflect_on_association(:comments)
        expect(temp.macro).to eq(:has_many)
    end
    it "should create order" do 
        abc = Discussion.create(title:"ruby",content:"this is ",name:"text",likes:2,)
        expect(abc).to be_valid
    end 
end
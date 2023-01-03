require 'rails_helper'

RSpec.describe RepliesController, type: :controller do
    subject {FactoryBot.build(:reply)}
     context "GET index" do 
        it "should replace the customization if already customizaion exits then" do
            comment = FactoryBot.create(:comment)
            discussion = FactoryBot.create(:discussion)
            reply = FactoryBot.create(:reply)
            get :index,params:{
                discussion_id:discussion.id,
                comment_id: comment.id,
                id:reply.id
            }
            expect(assigns(:reply)).to eq(assigns(:comment).replies)
            expect(response).to be_successful
            expect(response.status).to equal(200)
        end
    end

    context "GET new" do 
        
        it "returns a successful response" do
            comment = FactoryBot.create(:comment)
            discussion = FactoryBot.create(:discussion)
           # comments = FactoryBot.create(:comment)
            get :new,params:{
                discussion_id:discussion.id,
                comment_id: comment.id
            } 
            expect(response).to be_successful
            expect(response.status).to eq(200) 
        end

        it "assigns @reply" do
            comment = FactoryBot.create(:comment)
            discussion = FactoryBot.create(:discussion)
            #comments = FactoryBot.create(:comment)
            get :new,params:{
                discussion_id:discussion.id,
                comment_id: comment.id
            } 
            expect(assigns(:reply)).to be_a_new(Reply)
        end

        it "renders the new template" do
            comment = FactoryBot.create(:comment)
            discussion = FactoryBot.create(:discussion)
            #comments = FactoryBot.create(:comment)
            get :new,params:{
                discussion_id:discussion.id,
                comment_id: comment.id
            } 
            expect(response).to render_template("new")
            expect(response.body).to eq ""
        end

    end 

    context "POST create" do 
        it 'creates the new Article all details are given' do
            comment = FactoryBot.create(:comment)
            discussion = FactoryBot.create(:discussion)
            reply = FactoryBot.create(:reply)
            # get :index,params:{
            #     discussion_id: discussion.id,id:comments.id
            #   }
            post :create, params: {reply: {     
                    reply: subject.reply,
                    username: subject.username,
                    comment_id: comment.id,
                    discussion_id:discussion.id},
                    discussion_id:discussion.id,
                    comment_id: comment.id,
                    id:reply.id
                }
            expect(assigns(:reply).save).to be_truthy
            expect(response).to redirect_to discussion_comments_path
        end
    end 
   
end
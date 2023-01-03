require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
    subject {FactoryBot.build(:comment)}
     context "GET index" do 
        it "should replace the customization if already customizaion exits then" do
            discussion = FactoryBot.create(:discussion)
            comments = FactoryBot.create(:comment)
            get :index,params:{
              discussion_id: discussion.id,id:comments.id
            }
            expect(assigns(:comments)).to eq(assigns(:discussion).comments)
            expect(response).to be_successful
            expect(response.status).to equal(200)
        end
    end

    context "GET new" do 
        
        it "returns a successful response" do
            discussion = FactoryBot.create(:discussion)
           # comments = FactoryBot.create(:comment)
            get :new,params:{
              discussion_id: discussion.id
            } 
            expect(response).to be_successful
            expect(response.status).to eq(200) 
        end

        it "assigns @comment" do
            discussion = FactoryBot.create(:discussion)
            #comments = FactoryBot.create(:comment)
            get :new,params:{
              discussion_id: discussion.id
            } 
            expect(assigns(:comment)).to be_a_new(Comment)
        end

        it "renders the new template" do
            discussion = FactoryBot.create(:discussion)
            #comments = FactoryBot.create(:comment)
            get :new,params:{
              discussion_id: discussion.id
            } 
            expect(response).to render_template("new")
            expect(response.body).to eq ""
        end

    end 

    context "POST create" do 
        it 'creates the new Article all details are given' do
            discussion = FactoryBot.create(:discussion)
            comments = FactoryBot.create(:comment)
            # get :index,params:{
            #     discussion_id: discussion.id,id:comments.id
            #   }
            post :create, params: {comment: {     
                    comment: subject.comment,
                    username: subject.username,
                    discussion_id: discussion.id,},
                    discussion_id: discussion.id,
                    id:comments.id
                }
            expect(assigns(:comment).save).to be_truthy
            expect(response).to redirect_to discussion_comments_path(id: discussion.id)
        end
    end 
    context "GET edit" do 
        
        it "returns a successful response" do
            discussion = FactoryBot.create(:discussion)
            comments = FactoryBot.create(:comment)
            get :edit,params:{
              discussion_id: discussion.id,
              id: comments.id
            } 
            expect(response).to be_successful
            expect(response.status).to eq(200) 
        end
    end

    context "PUt update" do 
        it "returns a successful response" do
            discussion = FactoryBot.create(:discussion)
            comments = FactoryBot.create(:comment)
            put :update,params: {comment: {     
                comment: "artciles",
                username: "names",
                discussion_id: discussion.id,},
                discussion_id: discussion.id,
                id:comments.id
            }
            expect(response.status).to eq(302) 
        end
    end

  
end
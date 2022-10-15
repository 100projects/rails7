require 'rails_helper'

RSpec.describe "Todos", type: :request do


  current_user = User.first_or_create!({email: "dahal@gmail.com", password:"theadsense", password_confirmation:"theadsense"})

  let(:valid_todo) do {
    id: 1,
    title: "this is valid ",
    completed: true,
    user_id: 1
  }
  end

  let(:invalid_todo) do {
    id: "eret",
    title: 1 ,
    completed: "sdsda"
  }
  end
  describe "GET /todos" do
    it "success with authenticated user" do
      sign_in(current_user)
      get todos_path
      expect(response).to have_http_status(200)
    end
    it "unsuccess with invalid user" do
      get todos_path
      expect(response).to have_http_status(302)
    end
  end


  describe "Get /todos/new" do

    it "should return valid response with authenticated user" do
      sign_in(current_user)
      get new_todo_path
      expect(response).to have_http_status(200)
    end

    it "should return invalid response with unauthenticated user" do
      get new_todo_path
      expect(response).to have_http_status(302)
    end

  end

  describe "POST /todos" do
    it 'should save post with authenticated user and valid request' do
      sign_in(current_user)
      expect do
      post todos_path, params: { "todo": valid_todo }
      end.to change(Todo, :count).by(1)
      # expect(request).to redirect_to(todo_url(1))

    end

    it 'should not save post with unauthenticated user and invalid request' do
      post todos_path, params: { "todo": invalid_todo }
      expect(request).to redirect_to(new_user_session_url)

    end

  end

  describe "update todo" do
    it 'should save post with authenticated user and valid request' do
      sign_in(current_user)
      todo = Todo.create! valid_todo


      patch todo_url(todo), params: {"todo":{"completed": false}}

      todo.reload

      expect(todo[:completed]).to eq(false)

      expect(request).to redirect_to(todo_url(1))

    end

  end

  describe "destroy todo" do

    it 'should delete item with valid user' do
      sign_in(current_user)
      todo = Todo.create! valid_todo
      expect{delete todo_url(todo)}.to change(Todo, :count).by(-1)

    end

  end
end

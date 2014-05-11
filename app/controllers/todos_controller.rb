class TodosController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @todos = current_user.todos
  end
  
  def create
    @todo = current_user.todos.new(todo_params)
    @todo.save
  end
  
  private
  
  def todo_params
     params.require(:todo).permit(:content, :finished)
   end
  
end

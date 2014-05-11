class TodosController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @todos = current_user.todos.order('priority')
  end
  
  def create
    @todo = current_user.todos.new(todo_params)
    @todo.save
  end
  
  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
  end
  
  def toggle
    @todo = Todo.find(params[:id])
    @todo.toggle!(:finished)
  end
  
  def sort
    # "todo_ids"=>["#todo_3", "#todo_6"]    
    
    params[:todo_ids].each_with_index do |id, index|
      Todo.where({id: id.split("_").last}).update_all({priority: index+1})
    end
    
    render nothing: true
  end
  
  private
  
  def todo_params
     params.require(:todo).permit(:content, :finished)
   end
  
end

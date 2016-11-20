class DocumentsController < ApplicationController
  before_filter :authenticate_user!, :except => :index

  def index
    @documents = Document.order(created_at: :desc)
    @document ||= Document.new
  end

  def create
    @document = Document.new(document_params.merge(user_email: current_user.email))
    if @document.save
      redirect_to root_path, :notice => "Successfully uploaded file"
    else
      render 'index'
    end
  end

  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    redirect_to root_path, notice: "File has been deleted."
  end

  private
  def document_params
    params.require(:document).permit(:url, :user_email)
  end
end

class AttachmentsController < ApplicationController

  def index
    @attachments = Attachment.all
    render json: @attachments, each_serializer: AttachmentSerializer, status: :ok
  end

  def show
    @user = @current_user
    @attachments = @user.attachments
    render json: @attachments, each_serializer: AttachmentSerializer, status: :ok
  end

  def showparticular
    @user = @current_user
    @attachment = @user.attachments.find(params[:id])
    render json: @attachment, each_serializer: AttachmentSerializer, status: :ok
  end

  def create
    @user = @current_user
    @attachment = @user.attachments.create(attachment_params)
    if @attachment.save 
      render json: @attachment, status: :created 
    else 
      render json: @attachment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @user = @current_user
    @attachment = @user.attachments.find(params[:id])
    if @attachment.destroy 
      render json: "Attachment deleted successfully", status: :ok
    else 
      render json: @attachment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    @user = @current_user
    @attachment = @user.attachments.find(params[:id])
    if @attachment.update(attachment_params)
      render json: @attachment, status: :ok 
    else 
      render json: @attachment.errors.full_messages, status: :unprocessable_entity
    end
  end
end
private 
  def attachment_params 
    params.permit(:title, :body, :file)
  end
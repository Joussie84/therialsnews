class CommentsController < ApplicationController
  before_action :set_publication, only: [:create, :destroy]
  before_action :set_comment, only: [:destroy]

  # POST /publications/:publication_id/comments
  def create
    @comment = @publication.comments.build(comment_params)
    @comment.user = current_user # Suponiendo que tienes un método current_user configurado

    if @comment.save
      redirect_to @publication, notice: 'El comentario fue creado exitosamente.'
    else
      redirect_to @publication, alert: 'Error al crear el comentario.'
    end
  end

  # DELETE /publications/:publication_id/comments/:id
  def destroy
    @comment.destroy
    redirect_to @publication, notice: 'El comentario fue eliminado exitosamente.'
  end

  private

  def set_publication
    @publication = Publication.find(params[:publication_id])
  end

  def set_comment
    @comment = @publication.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end

class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :set_comment, only: %i[ show edit update destroy ]
  before_action :set_post, only: [ :new, :create, :destroy ]  # cargo el post para la eliminación
  before_action :authorize_admin, only: [ :destroy ]  # solo admin puede eliminar comentarios

  # GET /comments or /comments.json
  def index
    @pagy, @comments = pagy(Comment.all)
  end

  # GET /comments/1 or /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = @post.comments.build # creo un nuevo comentario asociado al post
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments or /comments.json
  def create
    @comment = @post.comments.build(comment_params) # asocio el comentario al post
    @comment.user = current_user # asocio el comentario al usuario autenticado

    respond_to do |format|
      if @comment.save
        # redirecciono al post después de que el comentario se haya guardado
        format.html { redirect_to @post, notice: "Comentario creado." }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @post, notice: "Comentario actualizado." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment.destroy!

    respond_to do |format|
      format.html { redirect_to @post, status: :see_other, notice: "Comentario eliminado." }
      format.json { head :no_content }
    end
  end

  private

  # este método autoriza solo a los usuarios con rol de admin
  def authorize_admin
    unless current_user&.admin?
      redirect_to root_path, alert: "No estás autorizado!"
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_post
    @post = Post.find(params[:post_id]) # encuentro el post usando el post_id de las rutas anidadas
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:content)
  end
end

class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :no_more, :capcha, only: [ :create ]

#  # GET /comments
#  # GET /comments.json
#  def index
#    @comments = Comment.all
#  end
#
#  # GET /comments/new
#  def new
#    @comment = Comment.new
#  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to root_path, notice: 'Коментарий успешно добавлен' }
      else
        #format.html { render root_path }
        @comments = Comment.order("updated_at DESC")
        format.html {
          flash[:notice] = '<span style="color: red">Что-то не так с коментарием</span>'.html_safe
          render 'static/demo'
        }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'коммент успешно удалён' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:uname, :content)
    end

    def no_more
      # ограничение на 280 коментариев
      Comment.order("updated_at ASC").first.destroy if Comment.all.size > 280
    end

    def capcha
      redirect_to root_path, notice: 'Вы точно не бот?' if !params[:user][:email].blank?
    end

end

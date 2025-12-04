class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    # 폼에서 넘어온 데이터(post_params)로 새 게시글 객체를 만듦
    @post = Post.new(post_params)

    respond_to do |format|
      # 저장에 성공하면?
      if @post.save
        # 방금 쓴 글의 상세 페이지(@post)로 이동
        format.html { redirect_to @post, notice: "게시글을 작성했습니다!" }
        format.json { render :show, status: :created, location: @post }
      # 저장이 실패하면? (제목이 비었거나 등등)
      else
        # 다시 글쓰기 화면(:new)을 보여줌 (썼던 내용은 그대로 유지)
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "게시글을 수정했습니다!", status: :see_other }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy!

    respond_to do |format|
      format.html { redirect_to posts_path, notice: "게시글을 삭제했습니다!", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def post_params
      # 보안 검사: 제목(title)이랑 내용(content)만 받아줌, 해킹 시도 차단
      params.expect(post: [ :title, :content ])
    end
end

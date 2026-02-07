class PostsController < ApplicationController
  # 액션(메서드)를 실행하기 전에 set_post 작업 시작
  # 게시글에 작업을 할 때는 게시글 번호를 찾아야함으로, 처음 시작부터 미리 찾게 시키는 작업
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index
    # 게시판 글 목록을 생성일(created_at)기준 내림차순(:desc)으로 정리
    @posts = Post.order(created_at: :desc)
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
    # params: 주소에 있는 정보({ id: 1 }), 폼에 입력한 정보(제목, 내용 등등)이 포함된 해시
    @post = Post.new(post_params) # post_params 메서드로 확인 후 저장

    respond_to do |format|
      # 저장에 성공하면?
      if @post.save
        # 방금 쓴 글의 상세 페이지(@post)로 이동
        # redirect_to: 새로고침 효과. 작업이 끝나면 주소로 이동
        format.html { redirect_to @post, notice: "게시글을 작성했습니다!" }
        # render :show : app/views/posts/show.json.jbuilder 파일을 사용해서 데이터를 보여줌
        # status: :created : 성공적으로 생성되었다
        # location: @post : 데이터의 주소를 알려주는 것임
        format.json { render :show, status: :created, location: @post }

      # 저장이 실패하면? (제목이 비었거나 등등)
      else
        # 다시 글쓰기 화면(:new)을 보여줌 (썼던 내용은 그대로 유지)
        # render :new : 페이지를 이동(새로고침)하지 않고 지금 가지고 있는 데이터(@post)를
        # 가지고 new.html.erb 화면만 다시 그림
        # status: :unprocessable_entity : 에러 코드를 보내줌
        format.html { render :new, status: :unprocessable_entity }
        # json: @post.errors: 왜 실패했는지 이유를 데이터로 보내줌
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        # status: :see_other : 리다이렉트의 정석
        # 폼 전송(POST, PUT) 처리는 끝났으니, 결과는 저쪽 주소(GET)로 가서 확인(see other)하라는 뜻
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
      # 글이 지워졌으니 상세페이지로 갈 수 없음. 그래서 전체 목록(posts_path)으로 이동
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
      # expect: 'post'라는 이름표가 붙어있는지 확인
      params.expect(post: [ :title, :content ])
    end
end

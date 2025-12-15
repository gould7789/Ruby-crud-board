# 📝 Rails CRUD Board (게시판 프로젝트)

루비 온 레일즈(Ruby on Rails) 학습을 위해 제작한 **CRUD 게시판**입니다.
기본적인 게시글 작성, 조회, 수정, 삭제(CRUD) 기능을 구현하였으며, **Bootstrap 5**를 적용하여 깔끔하고 반응형인 UI를 구성했습니다.

---

## 🛠️ Tech Stack (사용 기술)

* **Framework**: Ruby on Rails 7
* **Language**: Ruby
* **Frontend**: ERB, Bootstrap 5.3 (CDN)
* **Database**: PostresQL
* **IDE**: VS Code

---

## ✨ Key Features (주요 기능)

### 1. 게시글 CRUD
* **Create**: 새로운 게시글 작성
* **Read**: 전체 글 목록 조회 (최신순 정렬) 및 상세 조회
* **Update**: 게시글 내용 수정
* **Delete**: 게시글 삭제 (Turbo Confirm 적용)

### 2. UI/UX Design
* **Bootstrap 5 적용**: Navbar, Card, Button, Table 등 모던한 컴포넌트 사용.
* **반응형 레이아웃**: Grid System(`col-lg-8` 등)을 활용하여 모바일과 데스크탑 환경 모두 지원.
* **가독성 개선**: `simple_format`을 이용한 줄바꿈 처리 및 타이포그래피 설정.

### 3. 기능 고도화
* **Validation (유효성 검사)**:
    * 제목(Title) 필수 입력.
    * 내용(Content) 필수 입력 및 최소 길이(5자) 제한.
    * 에러 발생 시 Bootstrap Alert 창으로 직관적인 피드백 제공.
* **I18n (국제화)**:
    * 기본 언어를 한국어(`ko`)로 설정.
    * 에러 메시지 및 시간 포맷을 한국 정서에 맞게 커스터마이징 (`ko.yml`).
    * 조사 처리("은/는" 등)를 자연스럽게 수정.
* **Timezone**: 서버 시간을 `Seoul`로 설정하여 작성 시간이 한국 시간으로 정확히 표시됨.

---

## 📸 Screen Shots (실행 화면)

### 1. 메인 목록 페이지 (Index)
> 깔끔한 테이블 디자인과 최신순 번호 정렬

<img width="1569" height="721" alt="image" src="https://github.com/user-attachments/assets/ff6bbe05-4714-4f74-a792-b649ccb243e5" />


### 2. 글 작성 페이지 (New)
> 카드형 폼 디자인과 유효성 검사 에러 메시지

<img width="1331" height="847" alt="image" src="https://github.com/user-attachments/assets/73da0244-9c77-45ea-8e79-d7fae039b8c9" />


### 3. 상세 조회 페이지 (Show)
> 읽기 편한 카드 뷰와 하단 버튼 배치

<img width="1380" height="591" alt="image" src="https://github.com/user-attachments/assets/d4d44800-7725-4f36-819e-2aae29c10fd9" />


---

## 📂 Project Structure (주요 코드)

* **Controller**: `posts_controller.rb` - 최신순 정렬(`order(created_at: :desc)`) 및 CRUD 액션 처리.
* **Model**: `post.rb` - `validates`를 통한 데이터 무결성 검사.
* **View**:
    * `layouts/application.html.erb`: Navbar 및 전체 레이아웃 설정.
    * `posts/new.html.erb`: `form_with`와 Bootstrap Form을 결합한 입력 UI.
* **Config**: `application.rb` (Timezone 설정), `locales/ko.yml` (한글 번역).

---

## 🚀 How to Run (실행 방법)

```bash
# 1. 저장소 클론
git clone [레포지토리 주소]

# 2. 젬 설치
bundle install

# 3. 데이터베이스 마이그레이션
rails db:migrate

# 4. 서버 실행
./bin/dev
# 또는
rails s

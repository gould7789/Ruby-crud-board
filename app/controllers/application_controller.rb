class ApplicationController < ActionController::Base
  # 이 파일의 역할: 우리 프로그램의 전체에 공통적으로 적용되는 규칙을 정함
  # 이곳에 선언되는 규칙들은 모든 기능(게시판, 회원가입 등등)에 적용됨
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.

  # 예전 오래된 브라우저에서는 접속 차단
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  # 자바스크립트 파일 버전을 관리해주는 최적화 코드 -> 캐시를 관리함
  stale_when_importmap_changes
end

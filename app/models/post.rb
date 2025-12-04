class Post < ApplicationRecord
  # 유효성 검사(Validation) 코드 추가하기

  # 제목은 필수로 작성하게 하기
  # 오류 메시지 작성
  validates :title, presence: { message: "은 필수입니다. 제목을 적어주세요." }

  # 내용 필수로 작성하게 하기(최소 5글자 이상)
  # 오류 메시지 작성
  validates :content, presence: { message: "은 비워둘 수 없습니다. 내용을 적어주세요." }, length: { minimum: 5, message: "이 너무 짧습니다. 5글자 이상 적어주세요." }
end

class ApplicationRecord < ActiveRecord::Base
  # 직접 사용되지 않고 Post, User 같은 진짜 모델들의 부모 역할만 함
  primary_abstract_class
end

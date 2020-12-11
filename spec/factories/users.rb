FactoryBot.define do
  factory :user do
    name              {"テスト"}
    email                 {"test@test.com"}
    password              {"test0000"}
    password_confirmation {password}
    first_name {"太郎"}
    first_name_furigana {"タロウ"}
    last_name {"テスト"}
    last_name_furigana {"テスト"}
    birthday {"1990-01-01"}
  end
end
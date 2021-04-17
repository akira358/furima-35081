FactoryBot.define do
  factory :user do
    name              {'test'}
    email                 {'test@example'}
    password              {'a00000'}
    password_confirmation {password}
    last_name              {"あいう"}
    first_name             {"あいう"}
    last_name_kana         {"アイウ"}
    first_name_kana        {"アイウ"}
    birth_date             {"1900-01-01"}

  end
end
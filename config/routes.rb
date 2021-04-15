Rails.application.routes.draw do
  root to: 'furimas#index'
  resources :furimas, only: :index
end


# この後の流れ
# ・ルーティングの設定（トップページ）
# ・GitHubデスクトップでコミット、プッシュ
# ・ターミナルでgit push heroku master
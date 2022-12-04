# frozen_string_literal: true

json.extract! menu, :id, :title, :body, :price, :created_at, :updated_at
json.url menu_url(menu, format: :json)

if Rails.env = 'development'
  Dotenv.require_keys('GITHUB_TOKEN')
end

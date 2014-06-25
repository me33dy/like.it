OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '650685288354078', '10435c1748b4f127b2bf5c94ba5ad655', scope: "email, publish_actions"
end
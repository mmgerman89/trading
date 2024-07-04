class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  before_action :load_user_menu

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name])
  end

  def load_user_menu
    # @menu_options = YAML.load_file(Rails.root.join('config', 'menu_options.yml'))

    @menu_options = [
      {
        name: 'Inicio', url: root_path, icon: 'bi-house-door'
      },
      { name: 'Mi cuenta', url: 'javascript:;', icon: 'bi-house-door',
        items: [
          { name: 'Cerrar Sesión', url: '#' },
          { name: 'Mis datos', url: edit_user_registration_path }
        ] 
      },
      {
        name: 'Crypto', url: crypto_path, icon: 'bi-house-door'
      },
      {
        name: 'Personas', url: people_path, icon: 'bi-house-door'
      },
      {
        name: 'Admin', url: rails_admin_path, icon: 'bi-collection-play', target: '_blank'
      }
    ]
  end
end

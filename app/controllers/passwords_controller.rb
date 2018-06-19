class PasswordsController < Devise::PasswordsController
  # POST /resource/password
  def create
    self.resource = resource_class.send_reset_password_instructions(params[resource_name])

    if resource.errors.empty?
      set_flash_message(:notice, :send_instructions) if is_navigational_format?
      respond_with resource, :location => new_session_path(resource_name)
    else

      # Redirect to custom page instead of displaying errors
      redirect_to accountgegevens_path

      # respond_with_navigational(resource){ render_with_scope :new }

    end
  end
end

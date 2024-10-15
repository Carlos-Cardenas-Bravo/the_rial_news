# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
  # GET /resource/password/new
  # def new
  #   super
  # end

  # POST /resource/password
  # se módifica el método create para validar el correo que solicta reestablecimiento de password
  def create
    self.resource = resource_class.find_by(email: params[:user][:email])

    if resource.nil?
      # si no se encuentra el correo
      flash[:alert] = "El correo electrónico no está registrado en el sistema."
      redirect_to new_user_password_path
    elsif resource.encrypted_password.blank?
      # si el usuario no tiene una contraseña creada
      flash[:alert] = "El correo electrónico no tiene una contraseña establecida."
      redirect_to new_user_password_path
    else
      # si el correo es válido, sigue con el flujo de Devise
      super
    end
  end

  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

  # PUT /resource/password
  def update
    self.resource = resource_class.reset_password_by_token(resource_params)
    yield resource if block_given?

    if resource.errors.empty?
      resource.unlock_access! if unlockable?(resource)

      # Destruir la sesión existente para evitar que se inicie sesión automáticamente
      sign_out(resource) if user_signed_in?

      # Aquí estamos evitando que se inicie sesión automáticamente
      # Y redirigimos al usuario a una página para confirmar que la contraseña ha sido cambiada.
      respond_with resource, location: after_resetting_password_path_for(resource)
    else
      set_minimum_password_length
      respond_with resource
    end
  end

  protected

  # Después de restablecer la contraseña, redirigir a una página específica
  def after_resetting_password_path_for(resource)
    new_user_session_path
  end

end

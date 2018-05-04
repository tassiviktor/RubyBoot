class Apiv2::UsersController < ApplicationController

  RESOURCE_CLASS = Apiv2::User
  RESOURCE_SYM = :apiv2_user
  include Crud

end

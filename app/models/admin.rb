class Admin
  include Mongoid::Document

  embedded_in :admin
end
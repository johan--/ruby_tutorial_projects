class AccountsController < ApplicationController
  def new
    @account = Account.new
    @account.owner = User.new #!
  end
end

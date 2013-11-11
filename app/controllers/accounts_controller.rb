class AccountsController < ApplicationController
  skip_before_filter :authorize_action, only: :confirm
  def index
    @accounts = Account.all
  end

  def show
    @account = Account.find(params[:id])
  end

  def new
    @account = Account.new
  end

  def edit
    @account = Account.find(params[:id])
  end

  def create
    @account = Account.new(params[:account])

    if @account.save
      redirect_to @account, notice: 'Account was successfully created.' 
    else
      render action: "new"
    end
  end

  def update
    @account = Account.find(params[:id])

    if @account.update_attributes(params[:account])
      redirect_to @account, notice: 'Account was successfully updated.'
    else
      render action: "edit"
    end
  end

  def confirm
    @account = Account.where( confirmation_token: params[ :id ] ).first

    if @account
      if @account.confirmed?
        redirect_to root_path
      else
        @account.update_attribute( :confirmed_at, Time.now )
        sign_in @account
        redirect_to edit_account_password_path
      end
    else
      redirect_to root_path, alert: "We could not find your account. Please contact administrators."
    end
  end

  def destroy
    @account = Account.find(params[:id])
    @account.destroy

    redirect_to accounts_url
  end
end

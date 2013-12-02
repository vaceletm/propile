require 'spec_helper'

describe 'Account creation' do
  describe 'visiting config page as a maintainer' do
    before :each do
      @maintainer = create :confirmed_account
      log_in @maintainer
      visit root_path

      within '#main-navigation' do
        click_link 'Configuration'
      end
    end

    it 'has a link to create account' do
      within '#new_presenter_link' do
        page.should have_content 'New presenter/Maintainer'
      end
    end

    describe 'clicking new account link' do
      before :each do
        click_link 'New presenter/Maintainer'
      end

      it 'displays a form to add accounts' do
        page.should have_css 'form#new_presenter'

        within 'form#new_presenter' do
          page.should have_css 'input#presenter_email'
          page.should have_css 'select#presenter_role'
          page.should have_css 'input[type="submit"]'
        end
      end

      shared_examples_for :account_creation do
        it 'hides form' do
          page.should have_no_css 'form#new_presenter'
        end

        it 'notices confirmation email has been sent' do
          within '#account-creation' do
            page.should have_content 'Confirmation email has been sent'
          end
        end
      end

      describe 'filling account form to create maintainer' do
        before :each do
          within '#new_presenter' do
            fill_in 'Email', with: 'test-maintainer@example.com'
            select 'maintainer', from: 'presenter_role'

            click_button 'Create Presenter'
          end
        end

        it_behaves_like :account_creation
      end

      describe 'filling account form to create maintainer' do
        before :each do
          within '#new_presenter' do
            fill_in 'Email', with: 'test-maintainer@example.com'
            select 'presenter', from: 'presenter_role'

            click_button 'Create Presenter'
          end
        end

        it_behaves_like :account_creation
      end
    end
  end

  describe 'Following confirmation link' do
    before :each do
      @presenter = create :presenter_account
      visit confirm_account_path( id: @presenter.confirmation_token )
    end

    it 'displays password edition form' do
      within 'h1' do
        page.should have_content 'Change password'
      end

      page.should have_css 'form#edit_account'
    end

    describe 'updating password' do
      before :each do
        within 'form#edit_account' do
          fill_in 'account_password', with: 'new_password'
          fill_in 'account_password_confirmation', with: 'new_password'
          click_button 'Update Account'
        end
      end

      it 'shows logged in user home' do
        within '#main-navigation' do
          page.should have_content 'Tableau de bord'
        end
      end
    end
  end
end

require 'rails_helper'


RSpec.describe EmailAddressesController, type: :controller do

  let(:valid_attributes) {
    { address: 'email@example.com', contact_id: 1, contact_type: 'Person' }
  }

  let(:invalid_attributes) {
    { address: nil, contact_id: nil, contact_type: nil }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # EmailAddressesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #new" do
    it "assigns a new email_address as @email_address" do
      get :new, {}, valid_session
      expect(assigns(:email_address)).to be_a_new(EmailAddress)
    end
  end

  describe "GET #edit" do
    it "assigns the requested email_address as @email_address" do
      email_address = EmailAddress.create! valid_attributes
      get :edit, {:id => email_address.to_param}, valid_session
      expect(assigns(:email_address)).to eq(email_address)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      let(:johnny) { Person.create(first_name: 'Johnny', last_name: 'Bravo') }
      let(:valid_attributes) { {address: 'johnny@bravo.com', contact_id: johnny.id, contact_type: 'Person'} }

      it "creates a new EmailAddress" do
        expect {
          post :create, {:email_address => valid_attributes}, valid_session
        }.to change(EmailAddress, :count).by(1)
      end

      it "assigns a newly created email_address as @email_address" do
        post :create, {:email_address => valid_attributes}, valid_session
        expect(assigns(:email_address)).to be_a(EmailAddress)
        expect(assigns(:email_address)).to be_persisted
      end

      it "redirects to the created email_address contact" do
        post :create, {:email_address => valid_attributes}, valid_session
        expect(response).to redirect_to(johnny)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved email_address as @email_address" do
        post :create, {:email_address => invalid_attributes}, valid_session
        expect(assigns(:email_address)).to be_a_new(EmailAddress)
      end

      it "re-renders the 'new' template" do
        post :create, {:email_address => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:arnold) { Person.create(first_name: 'Arnold', last_name: 'Palmer') }
      let(:valid_attributes) { {address: 'arnold@palmer.com', contact_id: arnold.id , contact_type: 'Person'} }
      let(:new_attributes) { { address: 'newemail@example.com', contact_id: arnold.id, contact_type: 'Person'} }

      it "updates the requested email_address" do
        email_address = EmailAddress.create! valid_attributes
        put :update, {:id => email_address.to_param, :email_address => new_attributes}, valid_session
        email_address.reload
        expect(email_address.address).to eq('newemail@example.com')
      end

      it "assigns the requested email_address as @email_address" do
        email_address = EmailAddress.create! valid_attributes
        put :update, {:id => email_address.to_param, :email_address => valid_attributes}, valid_session
        expect(assigns(:email_address)).to eq(email_address)
      end

      it "redirects to the email_address" do
        email_address = EmailAddress.create! valid_attributes
        put :update, {:id => email_address.to_param, :email_address => valid_attributes}, valid_session
        expect(response).to redirect_to(arnold)
      end
    end

    context "with invalid params" do
      it "assigns the email_address as @email_address" do
        email_address = EmailAddress.create! valid_attributes
        put :update, {:id => email_address.to_param, :email_address => invalid_attributes}, valid_session
        expect(assigns(:email_address)).to eq(email_address)
      end

      it "re-renders the 'edit' template" do
        email_address = EmailAddress.create! valid_attributes
        put :update, {:id => email_address.to_param, :email_address => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    let(:arnold) { Person.create(first_name: 'Arnold', last_name: 'Palmer') }
    let(:valid_attributes) { {address: 'arnold@palmer.com', contact_id: arnold.id, contact_type: 'Person' } }

    it "destroys the requested email_address" do
      email_address = EmailAddress.create! valid_attributes
      expect {
        delete :destroy, {:id => email_address.to_param}, valid_session
      }.to change(EmailAddress, :count).by(-1)
    end

    it "redirects to the email_address contact" do
      email_address = EmailAddress.create! valid_attributes
      delete :destroy, {:id => email_address.to_param}, valid_session
      expect(response).to redirect_to(arnold)
    end
  end

end

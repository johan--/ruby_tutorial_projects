require "rails_helper"

RSpec.describe ExampleMailer, type: :mailer do
  describe 'sample email' do
    let(:user) { User.create(name: 'Lucas', email: 'lucas@email.com') }
    let(:mail) { ExampleMailer.sample_email(user) }

    it 'renders the subject' do
      expect(mail.subject).to eql('Sample Email')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eql([user.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eql(['from@example.com'])
    end

    it 'assigns @name' do
      expect(mail.body.encoded).to match(user.name)
    end
  end
end

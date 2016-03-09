require 'spec_helper'


describe Invite do

  context 'recipient is already a user' do
    subject { create(:invite, :recipient_is_existing_user) }

    it 'has a token' do
      expect(subject.token).to_not be_nil
    end

    it 'sets recipient id based on email' do
      expect(subject.recipient_id).to_not be_nil
      expect(subject.recipient.email).to eq(subject.email)
    end
  end

  context 'recipient is not a user' do
    subject { create(:invite, :recipient_is_new_user) }

    it 'has a token' do
      expect(subject.token).to_not be_nil
    end

    it 'does not have a recipient yet' do
      expect(subject.recipient_id).to be_nil
    end
  end

end
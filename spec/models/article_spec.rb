require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :title }
		it { is_expected.to have_db_column :content }
		it { is_expected.to have_db_column :status }

  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :title }
		it { is_expected.to validate_presence_of :content }
		it { is_expected.to validate_presence_of :status }
    it { is_expected.to validate_length_of(:title).is_at_least(5) }
		it { is_expected.to validate_length_of(:content).is_at_least(10) }
	end

	describe 'Associations' do
		it { should belong_to(:category) }
	end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(create(:article)).to be_valid
    end
  end
end
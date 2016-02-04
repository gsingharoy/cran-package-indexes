require 'rails_helper'

describe Person, type: :model do
  it { should have_db_index :email }
  it { should have_many :authors }
  it { should have_many :maintainers }

  describe '::hash_from_str' do
    context 'string has email' do
      let(:str) { 'cole sear <cole.sear@example.com>' }
      it 'returns email in the hash' do
        expect(Person.hash_from_str(str)[:email]).to eq 'cole.sear@example.com'
      end

      it 'returns name in the hash' do
        expect(Person.hash_from_str(str)[:name]).to eq 'cole sear'
      end
    end
    context 'string does not have email' do
      let(:str) { 'cole sear' }
      it 'returns email in the hash as nil' do
        expect(Person.hash_from_str(str)[:email]).to eq nil
      end

      it 'returns name in the hash' do
        expect(Person.hash_from_str(str)[:name]).to eq 'cole sear'
      end
    end
  end

  describe '::create_from_str' do
    context 'string has email' do
      let(:str) { 'cole sear <cole.sear@example.com>' }
      it 'returns email in the hash' do
        expect(Person.create_from_str(str).email).to eq 'cole.sear@example.com'
      end

      it 'returns name in the hash' do
        expect(Person.create_from_str(str).name).to eq 'cole sear'
      end
    end
    context 'string does not have email' do
      let(:str) { 'cole sear' }
      it 'returns email in the hash as nil' do
        expect(Person.create_from_str(str).email).to eq nil
      end

      it 'returns name in the hash' do
        expect(Person.create_from_str(str).name).to eq 'cole sear'
      end
    end
  end
end

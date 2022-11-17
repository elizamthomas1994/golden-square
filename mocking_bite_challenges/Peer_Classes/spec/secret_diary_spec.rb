require 'secret_diary'

RSpec.describe SecretDiary do
  context 'initially' do
    it 'does not read because it is locked' do
      diary = double :diary
      secret_diary = SecretDiary.new(diary)
      expect { secret_diary.read }.to raise_error "Go away!"
    end
  end

  context 'when it is unlocked' do
    it 'reads diary contents' do
      diary = double :diary, read: "FAKE CONTENTS"
      secret_diary = SecretDiary.new(diary)
      secret_diary.unlock
      expect(secret_diary.read).to eq "FAKE CONTENTS"
    end
  end

  context 'when it is relocked' do
    it 'does not read the diary because it is locked' do
      diary = double :diary, read: "FAKE CONTENTS"
      secret_diary = SecretDiary.new(diary)
      secret_diary.unlock
      secret_diary.lock
      expect { secret_diary.read }.to raise_error "Go away!"
    end
  end
end
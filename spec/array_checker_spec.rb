require './array_checker'

describe 'ArrayChecker' do
  describe '#find_not_exist_number' do
    it 'ファイルが存在しない場合' do
      checker = ArrayChecker.new("./spec/fixtures/dummy")
      expect {expect(checker.find_not_exist_number)}.to raise_error Errno::ENOENT
    end

    it 'ファイルが配列の形式でない場合' do
      checker = ArrayChecker.new("./spec/fixtures/not_array")
      expect {expect(checker.find_not_exist_number)}.to raise_error ArgumentError
    end

    it '1 ~ 10000のうち、9999が存在しない場合' do
      checker = ArrayChecker.new("./spec/fixtures/not_number_9999")
      expect(checker.find_not_exist_number).to eq 9999
    end

    it '1 ~ 10000のうち、1が存在しない場合' do
      checker = ArrayChecker.new("./spec/fixtures/not_number_1")
      expect(checker.find_not_exist_number).to eq 1
    end

    it '1 ~ 10000のうち、10000が存在しない場合' do
      checker = ArrayChecker.new("./spec/fixtures/not_number_10000")
      expect(checker.find_not_exist_number).to eq 10000
    end
  end
end

require('rspec')
require('definitions')
require('words')



describe(Words) do

  before() do
    Words.clear()
  end


  describe('#word') do
    it('returns the word created') do
      test_word = Words.new({:word => "Getro"})
      expect(test_word.word()).to(eq("Getro"))
    end
  end

  describe('.all') do
    it('returns an empty array at first') do
      test_word = Words.new({:word => "Getro"})
      expect(Words.all()).to(eq([]))
    end
  end

  describe('#id') do
    it('returns the id of the word create') do
       test_word = Words.new({:word => "Getro"})
      expect(test_word.id()).to(eq(1))
    end
  end

  describe('#save') do
    it('saves the new word that was created') do
      test_word = Words.new({:word => "Getro"})
      test_word.save()
      expect(Words.all()).to(eq([test_word]))
    end
  end

  describe('.find') do
    it('will find the word in question with the help of the id') do
      test_word = Words.new({:word => "Getro"})
      test_word.save()
      test_word2 = Words.new({:word => "Getro"})
      test_word2.save()
      expect(Words.find(test_word.id())).to(eq(test_word))
    end
  end
end


describe(Definitions) do

  describe('#meaning') do
    it('returns the definition created') do
      test_meaning = Definitions.new({:meaning => "Getro"})
      expect(test_meaning.meaning()).to(eq("Getro"))
    end
  end
end

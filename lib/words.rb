class Words
  @@words_list = []
  attr_reader(:word)

  define_method(:initialize) do |attributes|
    @word = attributes.fetch(:word)
    @id = @@words_list.length().+(1)
    @definitions = []
  end

  define_singleton_method(:all) do
    @@words_list
  end

  define_method(:save) do
    @@words_list.push(self)
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:find) do |id|
    found_word = nil
    @@words_list.each() do |word|
      if word.id() == id.to_i
        found_word = word
      end
    end
    found_word
  end

  define_singleton_method(:clear) do
    @@Words_list = []
  end

  define_method(:definitions) do
    @definitions
  end

  define_method(:save_definition) do |definition|
    @definitions.push(definition)
  end

end

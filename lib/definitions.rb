class Definitions
  @@definitions_list = []
  attr_reader(:meaning)

  define_method(:initialize) do |attributes|
    @meaning = attributes.fetch(:meaning)
    @id = @@definitions_list.length().+(1)
  end

  define_singleton_method(:all) do
    @@definitions_list
  end

  define_method(:save) do
    @@definitions_list.push(self)
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:find) do |id|
    found_word = nil
    @@definitions_list.each() do |word|
      if word.id() == id.to_i
        found_word = word
      end
    end
    found_word
  end

  define_singleton_method(:clear) do
    @@definitions_list = []
  end
end

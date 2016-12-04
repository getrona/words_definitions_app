class Definitions
  attr_reader(:meaning)

  define_method(:initialize) do |attributes|
    @meaning = attributes.fetch(:meaning)
  end

end

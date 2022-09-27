module Exercise
  module Arrays
    class << self
      def qsort(array)
        return [] if array.empty?
        pivot = array.first
        rest = array[1..-1]
        left = rest.select { |el| el <= pivot }
        right = rest.select { |el| el > pivot }
        qsort(left).concat([pivot], qsort(right)) 
      end

      def replace(array)
        max = qsort(array).last
        array.map { |el| el.positive? ? max : el }
      end

      def search(_array, _query)
        0
      end
    end
  end
end

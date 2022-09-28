module Exercise
  module Arrays
    class << self
      def qsort(array)
        return [] if array.empty?

        pivot = array.first
        rest = array[1..]
        left = rest.select { |el| el <= pivot }
        right = rest.select { |el| el > pivot }
        qsort(left).concat([pivot], qsort(right))
      end

      def replace(array)
        max = qsort(array).last
        array.map { |el| el.positive? ? max : el }
      end

      def search(array, query)
        def bin_search(arr, low, high, query)
          if high >= low
            mid = (high + low) / 2
            return mid if arr[mid] == query

            if arr[mid] > query
              bin_search(arr, low, mid - 1, query)
            else
              bin_search(arr, mid + 1, high, query)
            end
          else
            -1
          end
        end

        bin_search(array, 0, array.size - 1, query)
      end
    end
  end
end

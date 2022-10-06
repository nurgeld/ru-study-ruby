module Exercise
  module Arrays
    class << self
      def get_max(array)
        max = array.first
        array.each { |el| max = el if el > max }
        max
      end

      def replace(array)
        max = get_max(array)
        array.map { |el| el.positive? ? max : el }
      end

      def search(array, query, low = 0, high = array.size - 1)
        return -1 if array.empty? || array[low] > query || array[high] < query

        mid = (low + high) / 2

        return mid if query == array[mid]

        query < array[mid] ? search(array, query, low, mid - 1) : search(array, query, mid + 1, high)
      end
    end
  end
end

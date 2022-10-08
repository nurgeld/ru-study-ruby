module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&func)
        i = 0
        while i < size
          func.call(self[i])
          i += 1
        end
        self
      end

      # Написать свою функцию my_map
      def my_map(&func)
        result = MyArray.new
        i = 0
        while i < size
          result << func.call(self[i])
          i += 1
        end
        result
      end

      # Написать свою функцию my_compact
      def my_compact
        result = MyArray.new
        i = 0
        while i < size
          result << self[i] if !self[i].nil?
          i += 1
        end
        result
      end

      # Написать свою функцию my_reduce
      def my_reduce; end
    end
  end
end

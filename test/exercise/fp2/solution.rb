module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&func)
        unless self.empty?
          func.call(first)
          MyArray.new(self[1..]).my_each(&func)
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
          result << self[i] unless self[i].nil?
          i += 1
        end
        result
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, &func)
        i = 0
        if acc.nil?
          acc = first
          i = 1
        end
        while i < size
          acc = func.call(acc, self[i])
          i += 1
        end
        acc
      end
    end
  end
end

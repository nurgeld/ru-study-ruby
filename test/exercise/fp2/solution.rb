module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&func)
        unless empty?
          yield first
          MyArray.new(self[1..]).my_each(&func)
        end
        self
      end

      # Написать свою функцию my_map
      def my_map(&func)
        func = lambda do |memo, el|
          memo << (yield el)
        end
        my_reduce(MyArray.new, &func)
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
        if size == 1
          return acc.nil? ? first : (yield acc, first)
        end

        (yield MyArray.new(self[0..-2]).my_reduce(acc, &func), self[-1])
      end
    end
  end
end

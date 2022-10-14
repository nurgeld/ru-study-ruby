module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&func)
        return if empty?

        yield first
        MyArray.new(self[1..]).my_each(&func)
        self
      end

      # Написать свою функцию my_map
      def my_map
        func = lambda do |memo, el|
          memo << (yield el)
        end
        my_reduce(MyArray.new, &func)
      end

      # Написать свою функцию my_compact
      def my_compact
        func = lambda do |memo, el|
          memo << el unless el.nil?
          memo
        end
        my_reduce(MyArray.new, &func)
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, &func)
        return acc if empty?

        acc = acc.nil? ? first : func.call(acc, first)
        MyArray.new(self[1..]).my_reduce(acc, &func)
      end
    end
  end
end

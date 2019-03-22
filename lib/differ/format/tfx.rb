module Differ
  module Format
    module TFX
      class << self
        def format(change)
          (change.change? && as_change(change)) ||
          (change.delete? && as_delete(change)) ||
          (change.insert? && as_insert(change)) ||
          ''
        end

      private
        def as_insert(change)
          {'add' => change.insert.inspect}
        end

        def as_delete(change)
          {'sub' => change.delete.inspect}
        end

        def as_change(change)
          {'sub' => change.delete.inspect, 'add' => change.insert.inspect}
        end
      end
    end
  end
end

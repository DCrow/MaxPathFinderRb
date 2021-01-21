module MaxPathFinder
  class Finder
    def initialize(nodes)
      @nodes = nodes
    end

    def max_path
      max_element[1]
    end

    def max_sum
      max_element[0]
    end

    private

    def max_element
      @max_element ||= @nodes.
        reduce([]) { |acc, cur_row| acc.empty? ? [[cur_row[0], [0]]] : calc_row(cur_row, acc) }.
        sort { |a1, a2| a1[0] > a2[0] ? -1 : 1 }[0]
    end

    def calc_row(cur_row, prev_data)
      cur_row.map.with_index do |el, idx|
        prev_node_idx = cacl_prev_node_idx(idx, prev_data)

        [prev_data[prev_node_idx][0] + el, prev_data[prev_node_idx][1] + [idx]]
      end
    end

    def cacl_prev_node_idx(idx, prev_data)
      return idx if idx == 0
      return idx - 1 if idx == prev_data.length

      prev_data[idx][0] > prev_data[idx-1][0] ? idx : idx - 1
    end
  end
end

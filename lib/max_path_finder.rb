require "max_path_finder/finder"
require "max_path_finder/version"

module MaxPathFinder
  def self.display(file_name)
    file_data = File.read(file_name)
    nodes = file_data.split("\n").map { |row| row.split(" ").map { |el| el.to_i } }

    finder = MaxPathFinder::Finder.new(nodes)
    new_nodes = finder.max_path.map.with_index do |max_idx, idx|
      new_line = nodes[idx].dup.map { |el| el.to_s }
      new_line[max_idx] += "!"
      new_line.join(" ")
    end

    new_nodes.join("\n")
  end
end

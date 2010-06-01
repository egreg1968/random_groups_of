class Array
	def random_groups_of(number)
		randomized = sort_by{ rand }
    groups = []
    if (number && number > 0)
      randomized.each_slice(number) do |slice|
        groups << slice
      end
      if (groups.size > 1 &&
        groups[-1].size < (number/2.0).round &&
        no_small_groups)
          groups.pop.each_with_index do |e, i|
            groups[i % groups.size - 1] << e # round robin
          end
      end
    end
    groups
	end
end
class Structs::Branch < Struct.new(:id, :name)
  BRANCHES = [
    { id: "TUC", name: 'tucson' },
    { id: "CIN", name: 'cincinnati' }
  ]

  class << self
    def find(id)
      if _d = BRANCHES.find { |d| d[:id] == id.to_s }
        hash_to_object(_d)
      end
    end

    def find_by_name(name)
      if _d = BRANCHES.find { |d| d[:name].to_s == name.to_s }
        hash_to_object(_d)
      end
    end

    def all
      BRANCHES.map do |d|
        hash_to_object(d)
      end
    end

    private

    def hash_to_object(_d)
      self.new(_d[:id], _d[:name])
    end
  end
end

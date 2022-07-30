class Pokemon
    attr_accessor :id, :name, :type, :db
    

    def initialize(name:, type:, id:, db:)
        @name = name
        @type = type
        @id = id
        @db = db
      end

    def self.save(name, type, db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type)
            VALUES (?, ?)
        SQL
        db.execute(sql, name, type)
    end

    def self.find(num, db)
        sql = <<-SQL
            SELECT * FROM pokemon
            WHERE id = ?
        SQL
        info = db.execute(sql, num).flatten 
        Pokemon.new(id: info[0], name: info[1], type: info[2], db: db) 
    end

end

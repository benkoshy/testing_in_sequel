require 'sequel'

DB = Sequel.postgres # memory database, requires sqlite3

class SequelTestCase < Minitest::Test
  def run(*args, &block)
    DB.transaction(:rollback=>:always, :auto_savepoint=>true){super}
  end
end

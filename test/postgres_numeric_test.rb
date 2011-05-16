# To run this script, set up the following postgres user and database:
#
#   sudo -u postgres createuser -D -A -P blog
#   sudo -u postgres createdb -O blog weblog_development
#

require 'jdbc_common'
require 'db/postgres'

class PostgresNumericTest < Test::Unit::TestCase
  def setup
    DbTypeMigration.up
  end

  def teardown
    DbTypeMigration.down
  end

  def test_should_keep_fractional_part
    expected = 7.3
    actual = DbType.create(:sample_default_decimal => expected).sample_default_decimal

    assert_equal expected, actual
  end
end

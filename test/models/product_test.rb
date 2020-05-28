require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "it should return branch name associated" do
    @product = products(:one)
    assert_equal @product.branch_name, "tucson"
  end

  test "it should not return branch name for wrong branch associated" do
    @product = products(:three)
    assert_nil @product.branch_name
  end

  test "unique part number for products error in DB" do
    @product = products(:one)
    @product_dup = @product.dup
    assert_raises ActiveRecord::RecordNotUnique do
      @product_dup.save(validate: false)
    end
  end

  test "missing part_number" do
    @product = products(:one)
    @product_dup = @product.dup
    @product_dup.part_number = nil
    assert_raises ActiveRecord::NotNullViolation do
      @product_dup.save(validate: false)
    end
  end

  test "missing part_price" do
    @product = products(:one)
    @product_dup = @product.dup
    @product_dup.part_price = nil
    @product_dup.part_number = @product.part_number + "asasa"
    assert_raises ActiveRecord::NotNullViolation do
      @product_dup.save(validate: false)
    end
  end

  test "missing branch_id" do
    @product = products(:one)
    @product_dup = @product.dup
    @product_dup.branch_id = nil
    @product_dup.part_number = @product.part_number + "asasa"
    assert_raises ActiveRecord::NotNullViolation do
      @product_dup.save(validate: false)
    end
  end
end
